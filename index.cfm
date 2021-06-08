<cfinclude template="header.cfm">

<cfhttp url="#cgi.http_host#/#jsonfile#" method="get">
<cfset Animals = #cfhttp.fileContent#>

<cfoutput>
<h2>What Does The Fox Say?</h2>
<form  class="form-inline" id="foxForm" method ="post">
<div class="form-group">
<select class="form-control" name="input_say" id="input_say">
<option value= "">CHOOSE A SOUND</option>
<cfloop array="#Animals.Animals#" item="i">
<option value= "#i.noise#">#i.noise#</option>
</cfloop>
</select>
</div>
<!---
<input type="hidden" name="qCheck" value="Fox">
--->
<button type="Submit" class="btn btn-default CheckSound" name="CheckSound">Check Sounds</button>
</form>
<cfif isDefined("form.CheckSound")>
<cfloop array="#Animals#" index="i">
<cfif i.Name IS form.qchecK>
<cfif form.input_say IS i.Noise>
<cfset Match = 1>

</cfif>
</cfloop>
<cfif Match IS 1>
<h1>Congrats! You Found the Fox</h1>
<img src="https://i.gifer.com/5sbR.gif">
<cfelse>
<img src="https://i.gifer.com/7FJ4.gif">
</cfif>
</cfif>
</cfoutput>
<script>
$('.CheckSound').click(function() {
if($('#input_say').val() == '') {

return false;
}else 
{
$('foxForm').submit();
}
});
</script>