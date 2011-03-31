<table class='boxSoft'>
	<tr>
		<th colspan='2' class='boxSoftTitle'><span class='f3'><?php print __("Statistics") ?></span></th>
	</tr>
	<tr>
		<td class='boxSoft'><span class='f4'><?php print __("Packages"); ?></span></td>
		<td class='boxSoft'><span class='f4'><?php print $unsupported_count; ?></span></td>
	</tr>
	<tr>
		<td class='boxSoft'><span class='f4'><?php print __("Orphan Packages"); ?></span></td>
		<td class='boxSoft'><span class='f4'><?php print $orphan_count; ?></span></td>
	</tr>
	<tr>
		<td class='boxSoft'><span class='f4'><?php print __("Packages added in the past 7 days"); ?></span></td>
		<td class='boxSoft'><span class='f4'><?php print $add_count; ?></span></td>
	</tr>
	<tr>
		<td class='boxSoft'><span class='f4'><?php print __("Packages updated in the past 7 days"); ?></span></td>
		<td class='boxSoft'><span class='f4'><?php print $update_count; ?></span></td>
	</tr>
	<tr>
		<td class='boxSoft'><span class='f4'><?php print __("Packages updated in the past year"); ?></span></td>
		<td class='boxSoft'><span class='f4'><?php print $update_year_count; ?></span></td>
	</tr>
	<tr>
		<td class='boxSoft'><span class='f4'><?php print __("Packages never updated"); ?></span></td>
		<td class='boxSoft'><span class='f4'><?php print $never_update_count; ?></span></td>
	</tr>
	<tr>
		<td class='boxSoft'><span class='f4'><?php print __("Registered Users"); ?></span></td>
		<td class='boxSoft'><span class='f4'><?php print $user_count; ?></span></td>
	</tr>
	<tr>
		<td class='boxSoft'><span class='f4'><?php print __("Trusted Users"); ?></span></td>
		<td class='boxSoft'><span class='f4'><?php print $tu_count; ?></span></td>
	</tr>
</table>
