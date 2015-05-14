# git-push-each

Push all the commits in a branch to their own branch, one commit at a time! \o/

### What, Why!?

Because sometimes you need to trick Github and CI servers to test every commit individually. The benefit is nice, per-commit indicators.

![](https://www.evernote.com/l/AMbQvZNfWtFAX5999ivsbMMlT66mCv9xk0AB/image.png)

## Install

```
git clone https://github.com/jbenet/git-push-each
cd git-push-each
mv git-push-each /usr/local/bin/.
```

## Usage

```
> git push-each --help
USAGE
    ./git-push-each [--clean] <remote> <branch-prefix>
    push each commit from stdin to its own branch.

OPTIONS
    --clean   delete all branches matching pattern:
              <branch-prefix><hash>

EXAMPLE
    > git cherry master | git push-each
    > git branch -r
    origin/gpi-18c4051fc502da15c3c279c37630f6d152ad6b3d
    origin/gpi-22ac071150daf8994f4891d57caeef3b4caf2571
    origin/master

    > git push-each --clean
    > git branch -r
    origin/master
```

### git push-each

```sh
# say you're working on a branch
> git checkout -b feat

# that has some new commits
> git cherry master
+ 90add39c1c5d24a5cdf7bfc8fe3ccf9ce847ddda
+ 22ac071150daf8994f4891d57caeef3b4caf2571
+ d603d44109832caf9172fcd256382f78f5113d10

# we can push each of those commits to its own branch
> git cherry master | git push-each
git push origin 90add39c1c5d24a5cdf7bfc8fe3ccf9ce847ddda:refs/heads/gpi-90add39c1c5d24a5cdf7bfc8fe3ccf9ce847ddda
...
git push origin 22ac071150daf8994f4891d57caeef3b4caf2571:refs/heads/gpi-22ac071150daf8994f4891d57caeef3b4caf2571
...
git push origin d603d44109832caf9172fcd256382f78f5113d10:refs/heads/gpi-d603d44109832caf9172fcd256382f78f5113d10
...

# check out the pushed branches
> git branch -r
  origin/gpi-22ac071150daf8994f4891d57caeef3b4caf2571
  origin/gpi-4142467492fec580ed8a20bf7193b350e8025bfe
  origin/gpi-90add39c1c5d24a5cdf7bfc8fe3ccf9ce847ddda
  origin/master

# now, they will _each_ trigger a hook.
```

Your pull request could now look like this:

![](https://www.evernote.com/l/AMap5-S_LP1AzYOrUYdjOCqRCrbAksiwQXYB/image.png)

Oh yeah.

### git push-each --clean

You can cleanup left-over branches in the remote with

```
git push-each --clean
```

This will delete any branches hanging around.

**Warning:** `--clean` does `git push -f <remote> :<branch-prefix><hash>`, so be careful with the prefix.

## Arguments

- `<remote>` specify the remote
- `<branch-prefix>` specify a branch prefix

## License

MIT
