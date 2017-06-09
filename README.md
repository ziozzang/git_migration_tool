# git migration (and copy) tool
Git repository copy from remote repository to another repository.

# How to use
Just get file and use like cp command.

```
curl -o gitcp https://raw.githubusercontent.com/ziozzang/git_migration_tool/master/gitcp.sh
chmod +x gitcp
gitcp [src_git_repo_url] [target_git_repo_url]
```

# limitation
* remote repository url must SSH. because it's passwordless! :)
* need git command of course! haha.
