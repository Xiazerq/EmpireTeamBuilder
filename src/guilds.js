//var guildObjects = {};
var lastLoaded = false;

window.guildBuildMemberTeams = function(JSON, ToonObject){
	var toonID = ToonObject.attr("value");
	var imageDom = ToonObject.children().first();

	//updateFilteredPlayers(JSON);
	var $template =  $("<li>", {
		class: "horizList playerToon toonProfile " + toonID,
		name: toonID
	}).append(
		imageDom.clone().addClass("playerToon")
	);

	for(var x = 0; x < JSON.length; x++){
		var _toon = JSON[x].toon;
		guildBuildMemberTeamRow(JSON[x].player);

		var _player = guildObjects[JSON[x].player.name];
		if(_player.children("." + toonID).length < 1){
			_player.append(guildBuildMemberToon($template, _toon ));

			guildUpdateTeamPower(_player, _toon ? JSON[x].toon.power : 0);
		}
	}
	//updateToonCount(ToonObject);
	updateFiltered();
    sortGuildTeams();

    console.log("Done");
     $( "#teamBuilder" ).trigger('sortupdate');
}

window.guildBuildMemberTeamRow = function(PlayerObj){
	var PlayerName = PlayerObj.name;

	if(!guildObjects.hasOwnProperty(PlayerName)){

		guildObjects[PlayerName] = $("<ul>", {
			class: PlayerName + " horizList trimmed playerData " + requestSelectedGuild(),
			name: PlayerName

		}).append(
			$("<div>", {class : "playerBanner dragndrop", value:"Banner"}).append(
				$("<h1>").append($("<a>", { href: 'https://swgoh.gg/' + PlayerObj.url, target: "_blank", text: PlayerObj.display})),
				$("<h1>",{class:"TotalPower", value: "0"}).text(0)));
		
		$("#guildTeams").append(guildObjects[PlayerName]);
	}

}

window.guildBuildMemberToon = function($Template, ToonData){
	var $toon = $Template.clone();

	//If the toon data is "toon": false, which will return if the member doesn't have it unlocked
	var _power = 0;
	if(ToonData){
		_power = ToonData.power;
		$toon.attr("value", _power).append(
			$("<a>", { href: 'https://swgoh.gg' + ToonData.url, target: "_blank"}).append(
				$("<img>", {
					src: 'images/borders/gear-icon-g' + ToonData.gear_level + ".svg",
					class: "playerGear"
				})
			),
			$("<img>", {
				src: 'images/inuse.png',
				class: "inuse hiddenData"
			}),
			 $("<div>", {class:"gearLevel hiddenData", text: ToonData.gear_level}),
			 $("<div>", {class:"starLevel hiddenData", text: ToonData.rarity}),
			 $("<div>", {class:"level", text: ToonData.level})
		);

		$toon.append(function(e){
			var rtn = $();
			for(var x = 0; x < 7; x++){
				_this = $("<div>", {class:"star star" + (x+1)});
				if(ToonData.rarity < (x + 1)){
					_this.addClass("star-inactive");
				}
				rtn = rtn.add(_this);
			}
			return rtn;
		});

		if(ToonData.zeta_abilities.length > 0){
			$toon.append($("<div>", {class:"zetas", text: ToonData.zeta_abilities.length}));
		}

	} else{ 
		$toon.attr("value", 0).addClass("locked").append($("<img>", {
			src: 'images/padlock-3-24.png',
			class: "lock"
		}));
	}


	/**/
	return $toon;
}

window.guildUpdateTeamPower = function($PlayerObject, AddPower){
	var $power = $PlayerObject.children(".playerBanner").children(".TotalPower");
	var _totalPower = parseInt($power.attr("value"), 10);
	var _toonPower = AddPower
	var _data = _totalPower + _toonPower;
	$power.attr("value", _data).text(_data);
}