# travis-pr-labels

## Reviewed
```
➜  ~ curl \
  -H "Accept: application/vnd.github.v3+json" \
  https://api.github.com/repos/xenoworf/travis-pr-labels/issues/1/labels\?name\=Reviewed
[
  {
    "id": 3966832618,
    "node_id": "LA_kwDOHEFsIs7scQ_q",
    "url": "https://api.github.com/repos/xenoworf/travis-pr-labels/labels/Reviewed",
    "name": "Reviewed",
    "color": "90F600",
    "default": false,
    "description": "OK to merge"
  }
]
```

## Not reviewed
```
➜  ~ curl \
  -H "Accept: application/vnd.github.v3+json" \
  https://api.github.com/repos/xenoworf/travis-pr-labels/issues/2/labels

[
  {
    "id": 3966092547,
    "node_id": "LA_kwDOHEFsIs7sZcUD",
    "url": "https://api.github.com/repos/xenoworf/travis-pr-labels/labels/Needs%20review",
    "name": "Needs review",
    "color": "215FC5",
    "default": false,
    "description": "This issue cannot be merged until it is reviewed"
  }
]
```

# Reviewed and not reviewed
```
➜  travis-pr-labels git:(main) curl \
  -H "Accept: application/vnd.github.v3+json" \
  https://api.github.com/repos/xenoworf/travis-pr-labels/issues/3/labels
[
  {
    "id": 3966092547,
    "node_id": "LA_kwDOHEFsIs7sZcUD",
    "url": "https://api.github.com/repos/xenoworf/travis-pr-labels/labels/Needs%20review",
    "name": "Needs review",
    "color": "215FC5",
    "default": false,
    "description": "This issue cannot be merged until it is reviewed"
  },
  {
    "id": 3966832618,
    "node_id": "LA_kwDOHEFsIs7scQ_q",
    "url": "https://api.github.com/repos/xenoworf/travis-pr-labels/labels/Reviewed",
    "name": "Reviewed",
    "color": "90F600",
    "default": false,
    "description": "OK to merge"
  }
]
```

## Neither reviewed nor not reviewed
```
➜  travis-pr-labels git:(main) curl \
  -H "Accept: application/vnd.github.v3+json" \
  https://api.github.com/repos/xenoworf/travis-pr-labels/issues/4/labels
[

]
```