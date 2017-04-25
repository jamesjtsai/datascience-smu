/* 
 * Assignment 11
 * MSDS 6391 - 04/22/17
 * James Tsai, Wid Sogata
 *
 */

function createDate(strDate) {
    var format = d3.time.format("%Y-%m-%d %H:%M:%S");
    return format.parse(strDate);
}

function remainingDays(current, target) {
    return Math.floor((target - current) / 1000 / 60 / 60 / 24);
}

function remainingHours(current, target) {
    return Math.floor((target - current) / 1000 / 60 / 60) % 24;
}

function remainingMinutes(current, target) {
    return Math.floor((target - current) / 1000 / 60) % 60;
}

function remainingSeconds(current, target) {
    return Math.floor((target - current) / 1000) % 60;
}

function createCountdown(end) {
    function updateClock()
    {
        var timeNow = new Date();
        var rDays = remainingDays(timeNow, end);
        var rHours = remainingHours(timeNow, end);
        var rMinutes = remainingMinutes(timeNow, end);
        var rSeconds = remainingSeconds(timeNow, end);
        if (rDays < 0)
            rDays = 0;
        if (rHours < 0)
            rHours = 0;
        if (rMinutes < 0)
            rMinutes = 0;
        add2Zero = d3.format("02d");
        document.getElementById("gradTitle").innerHTML = "Congratulations MSDS Class of 2017 !!!";
        document.getElementById("clockTitle").innerHTML = "The Final Countdown";
        document.getElementById("clockText").innerHTML =    add2Zero(rDays) + "D " +
                                                            add2Zero(rHours) + "H " +
                                                            add2Zero(rMinutes) + "M " +
                                                            add2Zero(rSeconds) + "S";
        document.getElementById("horseText").innerHTML = ".";
    } 
    setInterval(updateClock, 1000);   
}
var endDate = createDate("2017-05-20 14:00:00"); 
createCountdown(endDate);