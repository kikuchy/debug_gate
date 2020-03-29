# 🚪 debug_gate

Show your own debug menu in your flutter app!

![sample](./art/gate.gif)

## Install

```yaml
dependencies:
  debug_gate: (please put latest verion here)
```

## Usage

```dart
DebugGate(
  tapCount: 5,
  tapInterval: Durarion(millisecond: 600),
  debugMenuBuilder: (context) => YourDebugMenu(),
  child: YourPage(),
);
```

And tap screen speedy and repeatedly!! 👍
