import CGLib
import GLib
import Gtk

let status = Application.run { app in
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
    let buttons = RadioButton.groupLabeled("Right 1", "Right 2")
    rbox.add(widgets: buttons)

    window.showAll()
}

guard let status = status else {
    fatalError("Could not create Application")
}
guard status == 0 else {
    fatalError("Application exited with status \(status)")
}
