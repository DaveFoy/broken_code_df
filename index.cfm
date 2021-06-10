<cfinclude template="header.cfm">

<cfhttp url="#cgi.http_host#/#jsonfile#" method="get">
<cfset Animals = #cfhttp.fileContent#>

<!--- error found (need to deserialize the json)---> 
<cfset Animals = DeserializeJSON(Animals)>

<cfoutput>
    <h2>What Does The Fox Say?</h2>
    <form  class="form-inline" id="foxForm" method ="post">
        <div class="form-group">
 <!--- ENHANCEMENT: Added an ID to the select and added an "onChange" event so that it will had any previous submitted responses --->
        <select class="form-control" name="input_say" id="input_say" onchange="$('##answer').hide()">
            <option value= "">CHOOSE A SOUND</option>
            <cfloop array="#Animals.Animals#" item="i">
            	<option value= "#i.noise#">#i.noise#</option>
            </cfloop>
        </select>
        </div>
        
 <!--- error found (need to uncomment this line) --->  
 		<input type="hidden" name="qCheck" value="Fox">
        
        <button type="Submit" class="btn btn-default CheckSound" name="CheckSound">Check Sounds</button>
    </form>
<!--- ENHANCEMENT: Added the div with the ID "Answer" to hold the response message after submitting --->
    <div id="answer" styel="display:none;"></div>
    
    <cfif isDefined("form.CheckSound")>
<!--- Error Found (need to define the variable "Match"> --->  
		<cfset Match = 0>		

<!--- error found ("index" needs to be "item" and arrary needs to be Animals.Animals and not just Animals) --->  
 		<cfloop array="#Animals.Animals#" item="i">
            <cfif i.Name IS form.qchecK>
				<cfif form.input_say IS i.noise>
                	<cfset Match = 1>
<!--- error found (need to add </cfif>) ---> 
				</cfif>
            </cfif>
        </cfloop>
        
        <!--- 
			  ENHANCEMENT: I added an enhancement so that I can hide the "incorrect" message on option change
			  so it refreshes the incorrect error after changing my answer after I submit
		--->
        <cfif Match IS 1>        
			<script>
                $("##answer").html("<h1>Congrats! You Found the Fox</h1><img src='https://i.gifer.com/5sbR.gif'>");
                $("##answer").show();
            </script>
        <cfelse>
        	<script>
				$("##answer").html("<img src='https://i.gifer.com/7FJ4.gif'>");
				$("##answer").show();
			</script>           
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