$(document).ready(function(){
    requestToons();
    var request;
    $(".GuildData").click(function(event){

        var _guild = requestSelectedGuild();
        var _newGuild = $(this).attr("value");

        if(typeof(_guild) != "undefined" && _guild.localeCompare(_newGuild) == 0) return;

        $("#banner .selected").removeClass("selected");
        $(this).addClass("selected");

        //$(".playerData").hide();
        $("." + _guild).hide();


        var _newGuild = requestSelectedGuild();
        $("." + _newGuild ).show();

        var $team = $("#teamBuilder").children();

        requestJSON("./scripts/getGuildData.php", { character: false, guild: requestSelectedGuild(true)}, updateFilteredPlayers, false);
        
        $team.each(function(){
            var _item = $(this);
            requestGuildToons(_item)
            //BuildGuildTeams(_item);
        });

        sortGuildTeams();
  
    });

    $("#chimaera").click();
});
window.requestSelectedGuild = function(asRequest = false){
    return (!asRequest ? "guild_": "") + $("#banner .selected").attr("value");
}
window.requestGuildToons = function($toon){
    requestJSON("./scripts/getGuildData.php", { character: $toon.attr("value"), guild: requestSelectedGuild(true)}, guildBuildMemberTeams, $toon);
}

window.requestJSON = function(url, data, callback, passThroughData){
    var request;

    if (request) {
        request.abort();
    }

    request = $.ajax({
        url: url,
        contentType: "application/json",
        data: data,
        datatype: "JSON"
    });

    request.done(function (response, textStatus, jqXHR){
        callback(JSON.parse(response), passThroughData);
        //callback(response, passThroughData);
    });

    request.fail(function (jqXHR, textStatus, errorThrown){
        console.error(
            "The following error occurred: " + textStatus, errorThrown
        );

        $("#output").html("Error Getting Data");
    });
}

window.requestToons = function(){
   var request;

    //$("#getAPIJSON").click(function(event){
        //$("#output").html("Made It");

        if (request) {
            request.abort();
        }

        request = $.ajax({
            url: "./scripts/toons.json",
            contentType: "application/json",
            datatype: "JSON"
        });

        request.done(function (response, textStatus, jqXHR){
            //console.log(response);
            //BuildAllMembers();

            BuildToonGUI(JSON.parse(response));
            //BuildToonGUI(response);
            //$("#output").html(response);
            //$(".clipBoard").show(true);
        });

        request.fail(function (jqXHR, textStatus, errorThrown){
            console.error(
                "The following error occurred: " + textStatus, errorThrown
            );

            $("#output").html("Error Getting Data");
        });

        request.always(function () {
        });

}