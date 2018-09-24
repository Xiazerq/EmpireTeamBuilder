import 'jquery';
import 'jquery-ui';
import 'jquery-ui/ui/core';
import 'jquery-ui/ui/widgets/draggable';
import 'jquery-ui/ui/widgets/droppable';
import 'jquery-ui/ui/disable-selection';
import 'jquery-ui/ui/widgets/sortable';

import 'jquery-ui-touch-punch-amd/jquery.ui.touch-punch.min';

import './swgohDirect.css';
import './guilds.js';
import './update.js';
import './requests.js';

$( function() {
  $( "#toonSelector, #teamBuilder" ).sortable({
        connectWith: ".builder",
        placeholder: "toonProfile placeholder",
        scroll: false,
        receive: function( event, ui ) {

            console.log("Recieved");
            //var _ui = $(ui);
            var _item = $(ui.item);

            //Check if there is already 5 toons on the team, if so cancel the drop
            if ($("#teamBuilder").children().length > 5) {
                //ui.sender: will cancel the change.
                //Useful in the 'receive' callback.
                $(ui.sender).sortable('cancel');

            //Now check if it's the new toon is being sent from the catalog
            }else if(ui.sender[0].id == "toonSelector"){
              console.log(_item.attr("value"));

              requestGuildToons(_item);
              //BuildGuildTeams(_item);
              //BuildGuildTeams(_item.attr("value"), _item.children().first());
              //var _count = $("#guildTeams ul." + chimaera + " li." + ).length
              //_item.append($("<div>", {class:"level", text: $("#guildTeams li.REYJEDITRAINING").length}));

            }else {
              //If the new toon is being sent from the team builder recalculate the phase data
              $("#guildTeams ." + _item.attr("value")).each(function(){

                guildUpdateTeamPower($(this).parent(), parseInt($(this).attr("value"), 10) * -1);
                /*
                var $power = $(this).parent().children(".playerBanner").children(".TotalPower");
                var _totalPower = parseInt($power.attr("value"), 10);
                var _toonPower = parseInt($(this).attr("value"), 10);
                var _data = _totalPower - _toonPower;
                $power.attr("value", _data).text(_data); 
                */
                //$(this).remove();

              }).remove();
            }
            sortGuildTeams();
            
        }
      });
//.disableSelection();

  $( "#teamBuilder" ).sortable({
    update: function(event, ui ){
      console.log("Update");
      var _item = $(ui.item);
      var _index = _item.index();//$("#teamBuilder").

      //$(".")

      var thisGuild = requestSelectedGuild();//$("#banner .selected").attr("value");
      //$("#guildTeams ul.chimaera li.B2SUPERBATTLEDROID").length
      setTimeout(function(){
        $("#guildTeams>ul." + thisGuild + ">li." + _item.attr("value")).each(function(){
          var $this = $(this);
          var $parent = $this.parent();
          var _thisIndex = $parent.children().index($this);

          var $after =  $($parent.children().get(_index >= _thisIndex ? (_index + 1): _index));

          $this.insertAfter($after);
        });
      },400);
    }
  });
  
  $( "#guildTeams, .phaseTeams").sortable({
    placeholder: "placeholder trimmed playerData",
    connectWith: ".phaseTeams",
    handle: ".playerBanner",
    receive: function(event, ui){
      var $item = $(ui.item);
      var $close = $("<div>",{class: "closeTeam", text:"X"});
      var $cloned = $item.clone();
      $cloned.find("li>.inuse").remove();

      $cloned.children(".playerBanner").prepend($close);
      $close.click(function(){
        $cloned.remove();
        UpdatePhaseTeams();
      });
      $item.after($cloned);
      $(ui.sender).sortable('cancel');
      UpdatePhaseTeams();

    }
  });

  $( "#teamsFilter>select").on("change", function(){
    updateFiltered();
  });
  $( "#toonsFilter>select").on("change", function(){
    updateToonsFilteredGUI();
  });
  //
});