import QtQuick 2.0


Item {
    property date clock : new Date()
    property string hours
    property string minutes
    property string seconds
    property string milliseconds
    property string days
    property string months
    property string years
    function timeChanged(){
        var clock = new Date
        hours = clock.getHours() < 10 ? "0" + clock.getHours() : clock.getHours()
        minutes = clock.getMinutes() < 10 ? "0" + clock.getMinutes() : clock.getMinutes()
        seconds = clock.getSeconds() < 10 ? "0" + clock.getSeconds() : clock.getSeconds()
        milliseconds = clock.getMilliseconds() < 10 ? "0" + clock.getMilliseconds() : clock.getMilliseconds()
    }
    function dayChanged(){
        var clock = new Date
        days = clock.getDate() < 10 ? "0" + clock.getDate() : clock.getDate()
        months = clock.getMonth() < 10 ? "0" + clock.getMonth() : clock.getMonth()
        years = clock.getFullYear()
    }

    Timer{
        interval: 10
        running: true
        repeat: true
        triggeredOnStart: true
        onTriggered: timeChanged()
    }
    Timer{
        interval: 1000 * 60 * 60 * 24
        running: true
        repeat: true
        triggeredOnStart: true
        onTriggered: dayChanged()
    }

}
