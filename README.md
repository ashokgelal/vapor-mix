
## Vapor Mix

When [using Laravel Mix in your Vapor project][1], this package allows you to load appropriate hashed asset within your `.leaf` view files without having to know the exact name of the asset.

### Using in your Vapor project

1: In your `Package.swift` file add `Vapor Mix` as a dependency:

```swift
dependencies: [
   .Package(url: "https://github.com/ashokgelal/vapor-mix.git", majorVersion: 1),
]
```

2: Register `Mix` in your `main.swift` file:

```swift
if let leaf = drop.view as? LeafRenderer {
    leaf.stem.register(Mix())
}
```

3: After you have run *npm run* as described in [this article][1], you can call the **mix** tag as such:

```html
<link rel="stylesheet" href='#mix("/css/app.css")'>
<script src='#mix("/js/app.js")'></script>
```

### Building from the source

1: Clone it:

```bash
$ git clone https://github.com/ashokgelal/vapor-mix
```

2: Build it

```bash
$ swift build
```

3: Run the tests

```bash
$ swift test
```

### To learn more

Vapor Mix is inspired by, and based on, Laravel's excellent front end package called Laravel Mix. As such, the documents are (very) identical. If you want to learn more, visit:

[Laravel Mix on GitHub](https://github.com/JeffreyWay/laravel-mix)

[Compiling Assets on Laravel](https://laravel.com/docs/5.4/mix)

[1]: https://ashokgelal.com/2017/01/17/laravel-mix-and-vapor/