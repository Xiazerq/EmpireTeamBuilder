<?php
	libxml_use_internal_errors(true);

    date_default_timezone_set("America/New_York");


    function guildData_Organize($guildData, $toonName, $guildName){

    	$returnData = array();
		
		for($x = 0; $x < count($guildData->players); $x++){
			$player = $guildData->players[$x]->data;

				$displayName = $player->name;
				$player->name = preg_replace('/\s+/', "_", $displayName);
				$player->display = $displayName;

    			unset($player->ship_galactic_power);
    			unset($player->arena_leader_base_id);
    			unset($player->level); 
    			unset($player->character_galactic_power);
    			unset($player->arena_rank);
			//$toons = $guildData->players[$x]->units;

    		if($toonName != false){
				$memToon = guildData_MemberToon($toonName, $guildData->players[$x]->units);
			}else{
				$memToon = false;
			}
			$returnData[] = array(	'player' => $player,
									'toon' => $memToon
			);
			//if($memToon != false){}

		}

		//echo json_encode($guildData->players[0]->data);
		$data =  json_encode($returnData);
		if($data === null) {
			echo "{ ERROR : 'ERROR: JSON not valid' }";
		 // $ob is null because the json cannot be decoded
		}else{
			echo $data;
		}

    }

    function guildData_MemberToon($filterToon, $memberToons){

    	//array_filter($toons, $guildData_MemberToon()
    	$returnToon = false;

    	for($x = 0; $x < count($memberToons); $x++){

    		if(strcasecmp($filterToon, $memberToons[$x]->data->base_id) == 0){

    			$returnToon = $memberToons[$x]->data;
				//echo "test";
    			//var_dump($memberToons[$x]->data);
    			//$returnToon = array_diff_key($memberToons[$x]->data, ["gear" => "x", "stats" => "y"]);
    			unset($returnToon->gear);
    			unset($returnToon->stats);

    			break;
    		}

    	}
    	return $returnToon;

    }

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

	//require_once('assets/simple_html_dom.php');
	$toonName =  ($_GET['character']);
	$guildName = ($_GET['guild']);

	$pathName = getPath($guildName);

	//$string = file_get_contents("guildData/NEW_".$guildName.".json");
	$string = file_get_contents($pathName);
	$guildData = json_decode($string);
	
	if($guildData === null) {
		//echo "{ ERROR : 'ERROR: JSON not valid for ". $guildName . "'}";
		echo "{ ERROR : 'ERROR: JSON not valid' }";
	 // $ob is null because the json cannot be decoded
	}else{
		if($toonName != false){
			guildData_Organize($guildData, $toonName, $guildName);

		}else{

			guildData_Organize($guildData, false, $guildName);
		}
		//file_put_contents("guildData/".$guildName.'.json', $encodedJSON);

	}
	unset($guildData);
	unset($string);
	//var_dump($guildData->players[0]->data)

/** /
	$guilds = array(
			"chimaera" => "25666"
			);
	foreach($guilds as $guildName => $guildID){
		//https://swgoh.gg/api/guilds/25666/units/
		$url = "https://swgoh.gg/api/guilds/". $guildID;
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
	/**/

?>