$(document).ready(function(){
    requestToons();
    var request;
    $(".GuildData").click(function(event){
        event.preventDefault();

        if (request) {
            request.abort();
        }
        $("#banner .selected").removeClass("selected");
        $(this).addClass("selected");
        var thisGuild = $(this).attr("value");

        $(".playerData").hide();
         $("." + thisGuild ).show();

        var _url = "guildData/"+ thisGuild +".json"

        request = $.ajax({
            url: _url,
            contentType: "application/json",
            data: "JSON"
        });

        request.done(function (response, textStatus, jqXHR){
            //guildToons = JSON.parse(response);
            guildToons = response;

            BuildAllMembers();

            $("#teamBuilder").children().each(function(){
                var _item = $(this);

                BuildGuildTeams(_item);
                //Update counter


                //BuildGuildTeams(_item.attr("value"), _item.children().first());
                //$("#guildTeams ul.chimaera li.REYJEDITRAINING").length
            });

            sortGuildTeams();
        });

        request.fail(function (jqXHR, textStatus, errorThrown){
            console.error(
                "The following error occurred: "+
                textStatus, errorThrown
            );

            $("#output").html("Error Getting Data");
        });

    });
    //});
    $("#chimaera").click();
    //new Clipboard('.clipBoard');
});

function requestToons(){
   var request;

    //$("#getAPIJSON").click(function(event){
        //$("#output").html("Made It");

        if (request) {
            request.abort();
        }

        request = $.ajax({
            url: "scripts/toons.json",
            contentType: "application/json",
            data: "JSON"
        });

        request.done(function (response, textStatus, jqXHR){
            //console.log(response);
            BuildAllMembers();

            //BuildToonGUI(JSON.parse(response));
            BuildToonGUI(response);
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