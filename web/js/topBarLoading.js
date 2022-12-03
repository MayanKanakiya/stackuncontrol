$(function () {
    prettyPrint()
    function resetToDefaults() {
        topbar.config({
            autoRun: true,
            barThickness: 3,
            barColors: {
                '0': 'rgb(0, 121, 254)',
                '.25': 'rgb(0, 121, 254)',
                '.50': 'rgb(0, 121, 254)',
                '.75': 'rgb(0, 121, 254)',
                '1.0': 'rgb(0, 121, 254)'
            },
            shadowBlur: 10,
//            shadowColor: 'rgb(0, 121, 254)',
            className: 'topbar'
        })
    }

    // Page load
    resetToDefaults()
    topbar.show()
    setTimeout(function () {
        $('#main_content').fadeIn('slow')
        topbar.hide()
    }, 1500)
});