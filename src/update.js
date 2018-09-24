var guildObjects = {};

var guildToons;

var toonFilters = {keys: {}, values: []};

window.updateToonCount = function(ToonObj){
	
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

window.sortGuildTeams = function(){

	$("#guildTeams").children().sort(function(a, b){
		var _a = parseInt($(a).children(".playerBanner").children(".TotalPower").attr("value"),10);
		var _b = parseInt($(b).children(".playerBanner").children(".TotalPower").attr("value"),10);
		return _b - _a;
	}).appendTo( "#guildTeams" );

	updateFiltered();
}

window.BuildToonGUI = function(toonJSON){
	$toons = $("#toonSelector");

	//for(var _ID in toonJSON){
	for(var x = 0; x < toonJSON.length; x++){
		var _toon = toonJSON[x];

		var _img = $('<img>', { 
				  src: _toon.image.replace('//swgoh.gg/static/img/assets/', '../images/profiles/'),
				  alt: _toon.name,
				  class: "blankName"
				});

		var _filterClasses = updateToonFilters(_toon);

		$toons.append($("<li>", {
			id: _toon.base_id,
			class :"toonProfile dragndrop " + _filterClasses,
			value: _toon.base_id
		}).append(
			_img,
			$("<div>", {class:"level"}),
			$("<div>", {class:"zetas"})
		)); //.draggable()
	}

	//updateToonFiltersGUI();
	 toonFilters.values.sort(window.compare = function(a,b) {
		  return b.value.localeCompare(a.value);
	});
	for (var i = toonFilters.values.length - 1; i >= 0; i--) {

		//if($("#playerFilter").children().length < 2){
		$("#toonsCatFilter").append($("<option>",{
			class: "toonFilter",
			value: toonFilters.values[i].value,
			text: toonFilters.values[i].display
		}))
			//JSON[x].player
	}

}
window.updateToonFilters = function(ToonObj){
	var _filterClasses = "";
	var _prefix = "";

	for(var _cat in ToonObj.categories){
		_filterClasses += _prefix + updateFilterList(ToonObj.categories[_cat]) + " ";
	}

	_filterClasses += _prefix + updateFilterList(ToonObj.alignment)  + " ";
	_filterClasses += _prefix + updateFilterList(ToonObj.role)  + " ";

	return _filterClasses;
}
window.updateFilterList = function(rawFilter){
	var _cleaned = updateRawStringSpaces(rawFilter);
	if(!toonFilters.keys.hasOwnProperty(_cleaned)){
		toonFilters.keys[_cleaned] = toonFilters.values.length;
		toonFilters.values.push({value: _cleaned, display: rawFilter});
	}

	return _cleaned;
}
window.updateRawStringSpaces = function(rawString){
	return "filter_" + rawString.replace(/\s+/, "_").toLowerCase();
}
window.UpdatePhaseTeams = function(){
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

window.updateToonInUse = function(ToonID, PlayerID){
	$("#guildTeams>."+PlayerID+">li."+ToonID+">.inuse").show();
}

window.updateFiltered = function(){
	var starMin = parseInt($("#starFilter").val(), 10);
	var gearMin = parseInt($("#gearFilter").val(), 10);
	var player = $("#playerFilter").val();

    var thisGuild = requestSelectedGuild();//$("#banner .selected").attr("value");

    var _teams = "#guildTeams>ul." + thisGuild;
    $(_teams).show();

    if(starMin > 0){
		$(_teams + ">li>.star" + starMin + ".star-inactive").parent().parent().hide();
	}

	if(gearMin > 0){
	  $(_teams + ">li:visible>.gearLevel").each(function(){
	  		var $this = $(this);
	  		var _gear = parseInt($this.text(), 10);

	  		$parent = $this.parent().parent();
	  		$parent.toggle(_gear >= gearMin && $parent.is(":visible"));
	  });

	}
	if(player.localeCompare("0") != 0){
		$(_teams + ":not(." + player +")").hide();
	}

	if(starMin > 0 || gearMin > 0){
    	$(_teams + ">li>.lock").parent().parent().hide();
    }
    //updateToonCount(ToonObject);
    $("#teamBuilder").children().each(function(){
        updateToonCount($(this));
    });
    
	UpdatePhaseTeams();
}

window.updateToonsFilteredGUI = function(){
	var _catFilter = $("#toonsCatFilter").val();

	$("#toonSelector>li:hidden").show();
	if(_catFilter.localeCompare("0") != 0){
		$("#toonSelector>:not(."+ _catFilter + ")").hide();
	}
}

window.updateFilteredPlayers = function(JSON){

    //$("#playerFilter>.playerName." + requestSelectedGuild()).each().hide();

    JSON.sort(window.compare = function(a,b) {
		  return b.player.name.localeCompare(a.player.name)
	});

	if($("#playerFilter>option." + requestSelectedGuild()).length < 2){
		for (var x = JSON.length - 1; x >= 0; x--) {
			$("#playerFilter").append($("<option>",{
				class: "playerName " + requestSelectedGuild(),
				value: JSON[x].player.name,
				text: JSON[x].player.name
			}))
			//JSON[x].player
		};
	}
}
//