import CGLib
import GLib
import Gtk

// This array of widgets is only needed in this simple example
// to ensure that the UI elements will stick around, even when
// the activation handler has finished.
var widgets = Array<Widget>()
var appActionEntries = [
    GActionEntry(name: g_strdup("quit"), activate: { Gtk.ApplicationRef(gpointer: $2).quit() }, parameter_type: nil, state: nil, change_state: nil, padding: (0, 0, 0))
]

let status = Application.run(startupHandler: { app in
    app.addAction(entries: &appActionEntries, nEntries: appActionEntries.count, userData: app.ptr)
}, activationHandler: { app in
    let window = ApplicationWindowRef(application: app)
    window.title = "Hello, Radio Buttons"
    window.setDefaultSize(width: 160, height: 80)

    let hbox = Box(orientation: .horizontal, spacing: 10)
    let lbox = Box(orientation: .vertical, spacing: 0)
    let rbox = Box(orientation: .vertical, spacing: 0)
    window.set(child: hbox)
    hbox.append(child: lbox)
    hbox.append(child: rbox)

    //
    // create left hand side buttons manually, gtk-style
    //
    let button1 = CheckButton(label: "Left 1")
    let button2 = CheckButton(label: "Left 2")
    button2.set(group: button1)
    lbox.append(child: button1)
    lbox.append(child: button2)

    //
    // create right button group using convenience constructor
    //
    widgets = CheckButton.groupLabeled("Right 1", "Right 2")
    rbox.append(children: widgets)

    window.show()

    // keep the widgets around even after this function has returned
    widgets += [hbox, lbox, rbox]
    widgets += [button1, button2]
})

withExtendedLifetime(widgets) {
    guard let status = status else {
        fatalError("Could not create Application")
    }
    guard status == 0 else {
        fatalError("Application exited with status \(status)")
    }
}
