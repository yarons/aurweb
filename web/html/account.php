<?php

set_include_path(get_include_path() . PATH_SEPARATOR . '../lib');

include_once('aur.inc.php');         # access AUR common functions
include_once('acctfuncs.inc.php');   # access Account specific functions

$action = in_request("Action");

$need_userinfo = array(
	"DisplayAccount", "DeleteAccount", "AccountInfo", "UpdateAccount", "ListComments"
);

if (in_array($action, $need_userinfo)) {
	$row = account_details(in_request("ID"), in_request("U"));
	$PK = implode("\n", account_get_ssh_keys($row["ID"]));
}

/* This has to be done before the navigation headers are written,
 * because html_header() fetches the current username from the database,
 * which could be changed by process_account_form()
 */
if ($action == "UpdateAccount") {
	$success = false;
	$update_account_message = '';
	/* Details for account being updated */
	/* Verify user permissions and that the request is a valid POST */
	if (can_edit_account($row) && check_token()) {
		/* Update the details for the existing account */
		list($success, $update_account_message) = process_account_form(
			"edit", "UpdateAccount",
			in_request("U"),
			in_request("T"),
			in_request("S"),
			in_request("E"),
			in_request("BE"),
			in_request("H"),
			in_request("P"),
			in_request("C"),
			in_request("R"),
			in_request("L"),
			in_request("TZ"),
			in_request("HP"),
			in_request("I"),
			in_request("K"),
			in_request("PK"),
			in_request("J"),
			in_request("CN"),
			in_request("UN"),
			in_request("ON"),
			in_request("ID"),
			$row["Username"],
			in_request("passwd")
		);
	}
}

if ($action == "AccountInfo") {
	html_header(__('Account') . ' ' . $row['Username']);
} else {
	html_header(__('Accounts'));
}

# Main page processing here
#
echo "<div class=\"box\">\n";
echo "  <h2>".__("Accounts")."</h2>\n";

if (isset($_COOKIE["AURSID"])) {
	if ($action == "SearchAccounts") {

		# security check
		#
		if (has_credential(CRED_ACCOUNT_SEARCH)) {
			# the user has entered search criteria, find any matching accounts
			#
			search_results_page(in_request("O"), in_request("SB"),
					in_request("U"), in_request("T"), in_request("S"),
					in_request("E"), in_request("R"), in_request("I"),
					in_request("K"));

		} else {
			# a non-privileged user is trying to access the search page
			#
			print __("You are not allowed to access this area.")."<br />\n";
		}

	} elseif ($action == "DisplayAccount") {
		# the user has clicked 'edit', display the account details in a form
		#
		if (empty($row)) {
			print __("Could not retrieve information for the specified user.");
		} else {
			/* Verify user has permission to edit the account */
			if (can_edit_account($row)) {
				display_account_form("UpdateAccount",
					$row["Username"],
					$row["AccountTypeID"],
					$row["Suspended"],
					$row["Email"],
					$row["BackupEmail"],
					$row["HideEmail"],
					"",
					"",
					$row["RealName"],
					$row["LangPreference"],
					$row["Timezone"],
					$row["Homepage"],
					$row["IRCNick"],
					$row["PGPKey"],
					$PK,
					$row["InactivityTS"] ? 1 : 0,
					$row["CommentNotify"],
					$row["UpdateNotify"],
					$row["OwnershipNotify"],
					$row["ID"],
					$row["Username"]);
			} else {
				print __("You do not have permission to edit this account.");
			}
		}

	} elseif ($action == "DeleteAccount") {
		/* Details for account being deleted. */
		if (can_edit_account($row)) {
			$uid_removal = $row['ID'];
			$uid_session = uid_from_sid($_COOKIE['AURSID']);
			$username = $row['Username'];

			if (in_request('confirm') && check_token()) {
				if (check_passwd($uid_session, $_REQUEST['passwd']) == 1) {
					user_delete($uid_removal);
					header('Location: /');
				} else {
					echo "<ul class='errorlist'><li>";
					echo __("Invalid password.");
					echo "</li></ul>";
					include("account_delete.php");
				}
			} else {
				include("account_delete.php");
			}
		} else {
			print __("You do not have permission to edit this account.");
		}
	} elseif ($action == "AccountInfo") {
		# no editing, just looking up user info
		#
		if (empty($row)) {
			print __("Could not retrieve information for the specified user.");
		} else {
			include("account_details.php");
		}

	} elseif ($action == "UpdateAccount") {
		print $update_account_message;

		if (!$success) {
			display_account_form("UpdateAccount",
				in_request("U"),
				in_request("T"),
				in_request("S"),
				in_request("E"),
				in_request("BE"),
				in_request("H"),
				in_request("P"),
				in_request("C"),
				in_request("R"),
				in_request("L"),
				in_request("TZ"),
				in_request("HP"),
				in_request("I"),
				in_request("K"),
				in_request("PK"),
				in_request("J"),
				in_request("CN"),
				in_request("UN"),
				in_request("ON"),
				in_request("ID"),
				$row["Username"]);
		}

	} elseif ($action == "ListComments") {
		if (has_credential(CRED_ACCOUNT_LIST_COMMENTS, array($row["ID"]))) {
			# display the comment list if they're a TU/dev

			$total_comment_count = account_comments_count($row["ID"]);
			list($pagination_templs, $per_page, $offset) = calculate_pagination($total_comment_count);

			$username = $row["Username"];
			$uid = $row["ID"];
			$comments = account_comments($uid, $per_page, $offset);

			$comment_section = "account";
			include('pkg_comments.php');

		} else {
			print __("You are not allowed to access this area.");
		}

	} else {
		if (has_credential(CRED_ACCOUNT_SEARCH)) {
			# display the search page if they're a TU/dev
			#
			print __("Use this form to search existing accounts.")."<br />\n";
			include('search_accounts_form.php');

		} else {
			print __("You are not allowed to access this area.");
		}
	}

} else {
	# visitor is not logged in
	#
	print __("You must log in to view user information.");
}

echo "</div>";

html_footer(AURWEB_VERSION);

?>
