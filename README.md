# Rails-style date/time arithmetics in Swift

Admit it, you've always been jealous of you friend the Rails developer 
being able to write nice, readable date operations like these:

```ruby
some_future_date = 4.months.from_now
the_past = (2.days + 3.years).ago
```

Well, with Swift you can now have those in your iOS app as well! We 
can simply extent the `Int` data type with some computed properties
to convert the values into `NSDateComponents`. Then let's also add 
operator functions for addition and subtraction working with two 
`NSDateComponents` and we can write lines like these, too:

```js
println("now:                   \(NSDate.date())")
println("8 days later:          \(8.days.fromNow)")
println("2 weeks before:        \(2.weeks.ago)")
println("5 days, 3 month later: \((5.days + 3.months).fromNow)")
```
