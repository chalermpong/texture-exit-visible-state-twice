# ASCellNode didExitVisibleState is called twice when transition to another view controller

Ref: [https://github.com/TextureGroup/Texture/issues/1808](https://github.com/TextureGroup/Texture/issues/1808)

1. Run the project in XCode and iOS simulator
2. Click "Open Texture TableView"
3. Click on any cell on the next screen
4. In the log, you will see that each visible cell node get called `didExitVisibleState` -> `didEnterVisibleState` -> `didExitVisibleState`

## Example Log ##
```
DEBUG: viewWillDisappear <TextureDidExitVisibleStateTwice.MyASTableVC: 0x7fc864406500>
DEBUG: didExitVisibleState <TextureDidExitVisibleStateTwice.MyCell: 0x7fc866056000>
DEBUG: didEnterVisibleState <TextureDidExitVisibleStateTwice.MyCell: 0x7fc866056000>
DEBUG: didExitVisibleState <TextureDidExitVisibleStateTwice.MyCell: 0x7fc866056000>
```
