# Yarn

*Boolean Expectations*

## Usage

```swift
import Yarn
```

### Example

```swift
func someFunction() throws -> Bool {
    true
}

Yarn.expectFunctionToReturnTrue(someFunction)
Yarn.expectClosureToReturnFalse {
    false
}
```

### Example Output
```
5/9/21, 10:02 AM [yarn.console.log.expectation] ✅: expectFunctionToReturnTrue
5/9/21, 10:02 AM [yarn.console.log.expectation] ❌: expectClosureToReturnFalse
```

### Example Error

```swift
func someThrowingFunction() throws -> Bool {
    throw Yarn.SomeError.expectedError
}

Yarn.expectFunctionToThrowAnError(someThrowingFunction)
```

### Error Output
```
5/9/21, 10:02 AM [yarn.console.log.expectation] 🚨: expectFunctionToThrowAnError
{
    SomeError(message: "expectedError"): The operation couldn’t be completed. (Yarn.Yarn.SomeError error 1.)
}
```
