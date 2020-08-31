import CGLib
import GLib
import Gtk

// This array of widgets is only needed in this simple example
// to ensure that the UI elements will stick around, even when
// the activation handler has finished.
var widgets = Array<Widget>()

let status = Application.run(startupHandler: nil) { app in
    let window = ApplicationWindowRef(application: app)
    window.title = "Hello, Radio Buttons"
    window.setDefaultSize(width: 160, height: 80)

    let hbox = Box(orientation: .horizontal, spacing: 10)
    let lbox = Box(orientation: .vertical, spacing: 0)
    let rbox = Box(orientation: .vertical, spacing: 0)
    window.add(widget: hbox)
    hbox.add(widget: lbox)
    hbox.add(widget: rbox)

    //
    // create left hand side buttons manually, gtk-style
    //
    let button1 = RadioButton(label: "Left 1")
    let button2 = RadioButton(group: button1.group, label: "Left 2")
    lbox.add(widget: button1)
    lbox.add(widget: button2)

    //
    // create right button group using convenience constructor
    //
    widgets = RadioButton.groupLabeled("Right 1", "Right 2")
    rbox.add(widgets: widgets)

    window.showAll()

    // keep the widgets around even after this function has returned
    widgets += [hbox, lbox, rbox]
    widgets += [button1, button2]
}

withExtendedLifetime(widgets) {
    guard let status = status else {
        fatalError("Could not create Application")
    }
    guard status == 0 else {
        fatalError("Application exited with status \(status)")
    }
}
