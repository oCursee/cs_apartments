window.addEventListener('message', function(event) {
    var item = event.data;
    if (item.play === "playSound") {
        var effect = document.getElementById('effect')
        effect.play()

      
    }
})