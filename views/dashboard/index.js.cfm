$(document).ready(function(){
	<cfif StructKeyExists(SESSION, "user") AND isStruct(SESSION.user)>
		var newcontesthelper = '';
		$('a.contestlink').on('click', function(){
			newcontesthelper = $(this).attr('href').substring($(this).attr('href').lastIndexOf("/")+1);
			return true;
		});
		$('a.contestorlink').on('click', function(){	
			newcontesthelper = '';
			return true;
		});
		$('a.newcontest').on('click', function(){
			$(this).attr("href", $(this).attr("href") + "?contestid=" + newcontesthelper);
		});
	</cfif>
	$('div.graphselector').hide();
	$("div.graphselector#" + $('input[name=reportradio]:checked').val()).show();
	$('input[name=reportradio]').change(function(){
		$('div.graphselector').hide();
		$("div.graphselector#" + $('input[name=reportradio]:checked').val()).show();
	});
});