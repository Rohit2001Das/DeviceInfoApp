# DeviceInfoApp

 ## Features

- Get information about the device model, iOS version, serial number, storage, battery health, battery level, and processor.
- Use Swift to fetch device information without relying on third-party libraries.
- Some information cannot be gathered, as it needs third-party libraries and has security concerns.

# Explanation

Extensions are added to the UIDevice class to encapsulate the logic for retrieving device information.

UIDevice.deviceDetails is a static computed property that concatenates various device details, such as model, iOS version, serial number, storage, battery level, and processor information.

The processorInfo method within the extension extracts CPU information using system calls.
