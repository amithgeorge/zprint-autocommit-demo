workflow "on push" {
  on = "push"
  resolves = ["autofixers"]
}

action "autofixers" {
  needs = ["zprint"]
  uses = "actions/bin/sh@master"
  args = ["echo Fixers ok"]
}

action "zprint" {
  uses = "bltavares/actions/zprint@master"
  args = ["autofix"]
  secrets = ["GITHUB_TOKEN"]
  needs = ["pr filter"]
}

action "pr filter" {
  uses = "actions/bin/filter@master"
  args = "ref refs/pulls/*"
}
