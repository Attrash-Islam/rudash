### Developers Contribution 
Install:
```
bundle install
```

Run All Tests:
```
bundle exec rake test
```

Run Specific Test:
```
bundle exec ruby ./test/reduce.rb
```

Run Lint:
```
bundle exec rake lint
```

Some notes to be aware of:

- You must be aligned to the [Lodash behavior](https://lodash.com/docs/4.17.15) as much as possible.

- Prefer `require_relative` for local files and use `require` for gems only.

- Use `Rudash::DynamicArgsCount.call` to call predicate/iteratee functions (lambdas) to support dynamic argument calling with lambda with passing all the values.

- To add new function to Rudash please add a new file `xyz.rb` into `/lib/rudash` folder that define the new `xyz` function below `Rudash::Default` module. (Rudash will auto-require all files below `/lib/rudash` and will add the `Default` modules methods into Rudash).

- For each function you implement you need to add a test file below `/test` that match the function name and to write unit tests that covers most of the cases.

- We encourge you to use already implemented functions in Rudash when implementing new functions, which means that you can use `R_.filter` because it's already implemented. You can access Rudash functions by referring to `self` in your method.

- You're welcomed to update the [Rudash Website](https://rudash.netlify.com/) with the changes if relevant ([rudash-website github](https://github.com/Attrash-Islam/rudash-website)).

- All Rudash functions must be aligned with Ruby community style guidelines, which means that "isNil" becomes "nil?", and "groupBy" will be "group_by". Please run `bundle exec rake lint` and fix the lint errors if exist before opening your PR.

- You must **ALWAYS** (for now) bump the version in your PRs `(/lib/version.rb)`. Make sure to be aligned to the semantic versioning. In here, adding new functions will cause bumping the minor version, fixing some already implemented logic causes bumping the patch version.
