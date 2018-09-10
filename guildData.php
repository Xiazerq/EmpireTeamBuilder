<?php
	libxml_use_internal_errors(true);

    date_default_timezone_set("America/New_York");


    function guildData_Organize($guildData, $toonName, $guildName){

    	$returnData = array();
		
		for($x = 0; $x < count($guildData->players); $x++){
			$player = $guildData->players[$x]->data;
			//$toons = $guildData->players[$x]->units;

			$memToon = guildData_MemberToon($toonName, $guildData->players[$x]->units);

			if($memToon != false){

				$returnData[] = array(	'player' => $player,
										'toon' => $memToon

				);
			}

		}

		//echo json_encode($guildData->players[0]->data);
		$data =  json_encode($returnData);
		if($data === null) {
			echo "ERROR: JSON not valid for ".$guildName;
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
    			break;
    		}

    	}
    	return $returnToon;

    }

	//require_once('assets/simple_html_dom.php');
	$toonName =  ($_GET['toon']);
	$guildName = ($_GET['guild']);

	$string = file_get_contents("guildData/newChimaera.json");
	$guildData = json_decode($string);
	
	if($guildData === null) {
		//echo "{ ERROR : 'ERROR: JSON not valid for ". $guildName . "'}";
		echo "{ ERROR : 'ERROR: JSON not valid' }";
	 // $ob is null because the json cannot be decoded
	}else{
		guildData_Organize($guildData, $toonName, $guildName);
		//file_put_contents("guildData/".$guildName.'.json', $encodedJSON);

	}
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