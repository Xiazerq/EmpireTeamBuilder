<?php

	function getPath($guildName){
		$path1 = "guildData/1_".$guildName.'.json';

		$path2 = "guildData/2_".$guildName.'.json';
		
		
		if (!file_exists($path1)) {
    		return $path1;
		}else if(!file_exists($path2)){
			return $path2;
		}else{
			if(filemtime($path1) < filemtime($path2)){
				return $path1;
			}else{
				return $path2;
			}
		}
	}

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
		//https://swgoh.gg/api/guilds/25666/units/	OLD URL
		//https://swgoh.gg/api/guild/25666/			NEW URL
		$url = "https://swgoh.gg/api/guild/". $guildID;
		echo "<br>url:(".$url.")<br>";
		$encodedJSON = file_get_contents($url);

		$data = json_decode($encodedJSON);
		if($data === null) {
			echo "ERROR: JSON not valid for ".$guildName;
		 // $ob is null because the json cannot be decoded
		}else{

			$pathName = getPath($guildName);
			echo $pathName;
			//file_put_contents("guildData/NEW_".$guildName.'.json', $encodedJSON);
			file_put_contents($pathName, $encodedJSON);
		}
		unset($data);
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