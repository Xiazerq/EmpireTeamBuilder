var guildObjects = {};

var guildToons;

function updateToonCount(ToonObj){
	
	var thisGuild = requestSelectedGuild();
    //$("#banner .selected").attr("value");
    //$("#guildTeams ul.chimaera li.B2SUPERBATTLEDROID").length
    var _toonObjs = "#guildTeams>ul." + thisGuild + ">li." + ToonObj.attr("value")+ ":visible";
	var _count = $(_toonObjs + ":not(.locked)").length;
	var _zetaCount = $(_toonObjs + ">.zetas").length;
	/*
	$(_toonObjs + ">.zetas").each(function(){
		_zetaCount += parseInt($(this).text());
	})
*/
	ToonObj.children(".level").text(_count);

	if(_zetaCount > 0){
		ToonObj.children(".zetas").text(_zetaCount).toggle(true);
	}else{
		ToonObj.children(".zetas").toggle(false);
	}
	
}

function sortGuildTeams(){

	$("#guildTeams").children().sort(function(a, b){
		var _a = parseInt($(a).children(".playerBanner").children(".TotalPower").attr("value"),10);
		var _b = parseInt($(b).children(".playerBanner").children(".TotalPower").attr("value"),10);
		return _b - _a;
	}).appendTo( "#guildTeams" );

	updateFiltered();
}

function BuildToonGUI(toonJSON){
	$toons = $("#toonSelector");

	//for(var _ID in toonJSON){
	for(var x = 0; x < toonJSON.length; x++){
		var _toon = toonJSON[x];

		var _img = $('<img>', { 
				  src: _toon.image.replace('//swgoh.gg/static/img/assets/', 'images/profiles/'),
				  alt: _toon.name,
				  class: "blankName"
				});

		$toons.append($("<li>", {
			id: _toon.base_id,
			class :"toonProfile dragndrop",
			value: _toon.base_id
		}).append(
			_img,
			$("<div>", {class:"level"}),
			$("<div>", {class:"zetas"}),
			$("<div>", {class:"alignment hiddenData"}).text(_toon.alignment),
			$("<div>", {class:"role hiddenData"}).text(_toon.role)
		)); //.draggable()

	}

}

function UpdatePhaseTeams(){
      var $teams = $(".phaseTeams").children("ul");
      $("#numTeams").text($teams.length);
      var _val;
      if($teams.length > 0){
      	_val = (Math.floor((1 / $teams.length) * 100))+"%";
      }else{
      	_val = "N/A";
      }
      $("#numMin").text(_val);

      $("#guildTeams>>li>.inuse").hide();

      $teams.each(function(){
      	var _playerID = $(this).attr("name");
      	$(this).children("li").each(function(){
      		var _toonID = $(this).attr("name");
      		updateToonInUse(_toonID, _playerID);
      	});   	
      });
}

function updateToonInUse(ToonID, PlayerID){
	$("#guildTeams>."+PlayerID+">li."+ToonID+">.inuse").show();
}

function updateFiltered(){
	var starMin = parseInt($("#starFilter").val(), 10);
	var gearMin = parseInt($("#gearFilter").val(), 10);

    var thisGuild = $("#banner .selected").attr("value");

    var _teams = "#guildTeams>ul." + thisGuild + ">li";
    $(_teams).parent().show();

    if(starMin > 0){
		$(_teams + ">.star" + starMin + ".star-inactive").parent().parent().hide();
	}

	if(gearMin > 0){
	  $(_teams + ":visible>.gearLevel").each(function(){
	  		var $this = $(this);
	  		var _gear = parseInt($this.text(), 10);

	  		$parent = $this.parent().parent();
	  		$parent.toggle(_gear >= gearMin && $parent.is(":visible"));
	  });

	}

	if(starMin > 0 || gearMin > 0){
    	$(_teams + ">.lock").parent().parent().hide();
    }
    //updateToonCount(ToonObject);
    $("#teamBuilder").children().each(function(){
        updateToonCount($(this));
    });
    
	UpdatePhaseTeams();
}
//