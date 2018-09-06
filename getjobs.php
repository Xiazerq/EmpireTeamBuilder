<?php

	$guilds = array(
		"chimaera" => "25666",
		"vengeance" => "35846",
		"vanguard" => "36289",
		"predator" => "5973",
		"execut0r" => "44009",
		"reaper" => "26384",
		"ravager" => "26040",
		"eclipse" => "26453",
		"perilous" => "15981",
		"nemesis" => "33287",
		"devastator" => "42988"
		);

	foreach($guilds as $guildName => $guildID){
		//https://swgoh.gg/api/guilds/25666/units/
		$url = "https://swgoh.gg/api/guilds/". $guildID . "/units/";
		echo "url:(".$url.")";
		$encodedJSON = file_get_contents($url);

		$data = json_decode($encodedJSON);
		if($data === null) {
			echo "ERROR: JSON not valid for ".$guildName;
		 // $ob is null because the json cannot be decoded
		}else{
			file_put_contents("guildData/".$guildName.'.json', $encodedJSON);
		}
	}

	//https://swgoh.gg/api/characters/
	$encodedJSON = file_get_contents("https://swgoh.gg/api/characters/");
	$data = json_decode($encodedJSON);
	if($data === null) {
		echo "ERROR: JSON not valid for the toon data";
	 // $ob is null because the json cannot be decoded
	}else{
		file_put_contents("scripts/toons.json", $encodedJSON);
	}

?>