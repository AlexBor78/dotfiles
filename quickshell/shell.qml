import Quickshell
import Quickshell.Io
import QtQuick

Scope {
	id: root
	property string time

	Variants {
		model: Quickshell.screens;

		PanelWindow {
			required property var modelData
			screen: modelData

			implicitHeight: 30
			anchors {
				bottom: true
				left: true
				right: true
			}

			Text {
				anchors.centerIn: parent
				text: root.time
			}
		}
	}

	Process {
		id: dateProc
		command: ["date"]
		running: true
		stdout: StdioCollector {
			onStreamFinished: root.time = this.text
		}
	}

	Timer {
		interval: 1000
		running: true
		repeat: true
		onTriggered: dateProc.running = true
	}
}
