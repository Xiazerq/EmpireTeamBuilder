var guildObjects = {};
var guildToons;

function BuildAllMembers(){
	if(typeof(guildToons) == "undefined") return; 

	var _chewie = guildToons.CLONEWARSCHEWBACCA;

	for(var x = 0; x < _chewie.length; x++){
		var toon = _chewie[x];

		if(!guildObjects.hasOwnProperty(toon.player)){

			guildObjects[toon.player] = $("<ul>", {
				class: toon.player.replace(/\s+/, "_") + " horizList playerData " + $(".GuildData.selected").attr("value")

			}).append(
				$("<div>", {class : "playerBanner", value:"Banner"}).append(
					$("<h1>").text(toon.player),
					$("<h1>",{class:"TotalPower", value: "0"}).text(0)));
			
			$("#guildTeams").append(guildObjects[toon.player]);
		}
	}
}

function BuildGuildTeams(ToonObject){
	var toonID = ToonObject.attr("value");
	var imageDom = ToonObject.children().first();

	if(typeof(guildToons) == "undefined") return; 

	var $template =  $("<li>", {
				class: "horizList playerToon toonProfile " + toonID
			}).append(
				imageDom.clone().addClass("playerToon")
			);

			/*,,
				value: toon.power.toString()
				$("<img>", {
					src: 'images/borders/gear-icon-g' + toon.gear_level + ".svg",
					class: "playerGear"
				}),
				 $("<div>", {class:"gearLevel", text: toon.gear_level}),
				 $("<div>", {class:"level", text: toon.level})
			);*/

	for(var x in guildToons[toonID]){
		var toon = guildToons[toonID][x];

		if(!guildObjects.hasOwnProperty(toon.player)){

			guildObjects[toon.player] = $("<ul>", {
				class: toon.player.replace(/\s+/, "_") + " horizList playerData " + $(".GuildData.selected").attr("value")

			}).append(
				$("<div>", {class : "playerBanner", value :"banner"}).append(
					$("<h1>").text(toon.player),
					$("<h1>",{class:"TotalPower", value: "0"}).text(0)));
			
			$("#guildTeams").append(guildObjects[toon.player]);
		}
		var _pData = guildObjects[toon.player]; 
	
		if(_pData.children("." + toonID).length < 1){
			var $toon = $template.clone();

			/** /
			$("<li>", {
				class: "horizList playerToon toonProfile " + toonID,
				value: toon.power.toString()
			}).append(
				imageDom.clone().addClass("playerToon"),
				
			);

			/**/
			$toon.attr("value", toon.power).append(
				$("<img>", {
					src: 'images/borders/gear-icon-g' + toon.gear_level + ".svg",
					class: "playerGear"
				}),
				 $("<div>", {class:"gearLevel hiddenData", text: toon.gear_level}),
				 $("<div>", {class:"starLevel hiddenData", text: toon.rarity}),
				 $("<div>", {class:"level", text: toon.level})
			);

			$toon.append(function(e){
				var rtn = $();
				for(var x = 0; x < 7; x++){
					_this = $("<div>", {class:"star star" + (x+1)});
					if(toon.rarity < (x + 1)){
						_this.addClass("star-inactive");
					}
					rtn = rtn.add(_this);
				}
				return rtn;
			});
			/**/
			_pData.append($toon);

			var $power = _pData.children(".playerBanner").children(".TotalPower");
			var _totalPower = parseInt($power.attr("value"), 10);
			var _toonPower = parseInt($toon.attr("value"), 10);
			var _data = _totalPower + _toonPower;
			$power.attr("value", _data).text(_data); 
			
		}	
	}
	updateToonCount(ToonObject);

 var thisGuild = $("#banner .selected").attr("value");
	//Add not activated toons
	$("#guildTeams>ul." + thisGuild + ":not(:has(>li." + toonID + "))").each(function(){
		var $toon = $template.clone();

		$toon.attr("value", 0).addClass("locked").append($("<img>", {
					src: 'images/padlock-3-24.png',
					class: "lock"
				}));
		$(this).append($toon);

	});
}

function updateToonCount(ToonObj){
	
    var thisGuild = $("#banner .selected").attr("value");
    //$("#guildTeams ul.chimaera li.B2SUPERBATTLEDROID").length
	var _count = $("#guildTeams>ul." + thisGuild + ">li." + ToonObj.attr("value") + ":visible:not(.locked)").length
	ToonObj.children(".level").text(_count);
	
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
			class :"toonProfile",
			value: _toon.base_id
		}).append(_img, $("<div>", {class:"level"}))); //.draggable()

	}

}

function UpdatePhaseTeams(){
      var $teams = $(".phaseTeams").children();
      $("#numTeams").text($teams.length);
      var _val;
      if($teams.length > 0){
      	_val = (Math.floor((1 / $teams.length) * 100))+"%";
      }else{
      	_val = "N/A";
      }
      $("#numMin").text(_val);
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
	  		$this.parent().parent().toggle(_gear >= gearMin);
	  });

	}

	if(starMin > 0 || gearMin > 0){
    	$(_teams + ">.lock").parent().parent().hide();
    }
    //updateToonCount(ToonObject);
    $("#teamBuilder").children().each(function(){
        updateToonCount($(this));
    });
}
//