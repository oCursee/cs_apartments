window.addEventListener('message', function(event) {
    var item = event.data;
    if (item.play === "playSound") {
        var effect = document.getElementById('effect')
        effect.play()

      
    }
})


$(function () {
    function raidDisplay(bool) {
        if (bool) {
            $("#Raidcontainer").show();
        } else {
            $("#Raidcontainer").hide();
        }
    }

    raidDisplay(false)

    window.addEventListener('message', function(event) {
        var item = event.data;
        if (item.type === "displayRaid") {
            if (item.status == true) {
                raidDisplay(true)
            } else {
                raidDisplay(false)
            }
        }
        this.setTimeout(()=> {$('.spinner').hide}, 2000)
    })
    document.onkeyup = function (data) {
        if (data.which == 27) {
            $.post('https://cs_apartments/exit', JSON.stringify({}));
            return
        }
    };


    $('#lspdLogo2').click (function() {
        var valFloor = document.getElementById('floorInput').value
        //console.log(valFloor)
        if (valFloor.length != 0 || valFloor != 0 ) {
            $.post('https://cs_apartments/raid', JSON.stringify({room: parseInt(valFloor)}));
          //  console.log('Raid')
        }else{
            $.post('https://cs_apartments/cannotBeNul', JSON.stringify({}));
        }
       
    })
   

    
})