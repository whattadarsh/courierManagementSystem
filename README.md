# Courier Management System

A complete end-to-end Courier Management Software using Flutter and Firebase

## Commit Guidelines

It is recommended to keep your changes grouped logically within individual commits. Maintainers find it easier to understand changes that are logically spilt across multiple commits.

```git
git add file-name.md

git commit -m "[Commit Prefix] Commit Message(Title)" -m "Commit Body(Describe changes in brief)"
```

### Commit Message

Examples of commit messages with semantic prefixes:

```commit message
[ADD] <file-name>
[FIX] <file-name>
[MODIFY] <file-name>
[UPDATE] <file-name>
[REFACTOR] <file-name>
[DOCS] <file-name>

e.g. [ADD] RESOURCES.md
```

Common prefixes and their usecases:

- ADD: Add a new file
- FIX: A bug fix in file
- MODIFY: Change existing stuff/resource in the file
- UPDATE: Add new stuff/resource to the file
- REFACTOR: Restructure a file without changing external working

- DOCS: Commits related to documentation. Add this along with other relevent prefixes

### Commit Body

Example:

```Commit Body
This adds RESOURCES.md which consists a curated list of resources for C++
```

## File Name Guidelines

- Use lowercase words with `"_"` as separator
- For instance

```File Name
new-feature.MD       is incorrect
newFeature.md         is incorrect
new_feature.md       is correct
```
