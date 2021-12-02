# Contributing to Dotdot Data Model (formerly Zigbee Cluster Library)

Want to contribute? Great! First, read this page (including the small print at
the end). By submitting a pull request, you represent that you have the right to
license your contribution to the Connectivity Standards Alliance and the community, and agree by
submitting the patch that your contributions are licensed under the
[BSD 3-Clause](./LICENSE.md). Before submitting the pull request, please make
sure you have tested your changes and that they follow the project guidelines
for contributing code.

To contribute, you must be a member of the CSA Data Model Working Group.

# Contributing as a Connectivity Standards Alliance Data Model Working Group Member

As a participant of the Connectivity Standards Alliance Data Model Working Group, you can
attend Working Group meetings, propose changes to the Data Model specification, and 
contribute code for approved updates to the specification.

The requirements to become a member of the
[Data Model Repository](https://github.com/csa-iot/data-model) are:

-   Must be a [Participant member](http://www.zigbeealliance.org/join) or higher
    of the Connectivity Standards Alliance
-   Must be a Data Model Working Group member with confirmation of approval to contribute to Alliance Open Source projects in addition to Data Model Working Group Specifications.

# Bugs

If you find a bug in the source code, you can help us by
[submitting a GitHub Issue](https://github.com/csa-iot/data-model/issues/new).

The best bug reports provide a detailed description of the issue and
step-by-step instructions for predictably reproducing the issue. Even better,
you can
[submit a Pull Request](https://github.com/csa-iot/data-model/blob/main/CONTRIBUTING.md#submitting-a-pull-request)
with a fix.

# New Features

You can request a new feature using the existing New Feature Request process of the alliance.

# Contributing Code

The Data Model follows the "Fork-and-Pull" model for accepting contributions.

### Initial Setup

Setup your GitHub fork and continuous-integration services:

1. Fork the
   [Data Model repository](https://github.com/csa-iot/data-model) by
   clicking "Fork" on the web UI.

2. All contributions must pass all checks and reviews to be accepted.

Setup your local development environment:

```bash
# Clone your fork
git clone git@github.com:<username>/data-model.git

# Configure upstream alias
git remote add upstream git@github.com:csa-iot/data-model.git
```

### Submitting a Pull Request

#### Branch

For each new feature, create a working branch:

```bash
# Create a working branch for your new feature
git branch --track <branch-name> origin/main

# Checkout the branch
git checkout <branch-name>
```

#### Create Commits

```bash
# Add each modified file you'd like to include in the commit
git add <file1> <file2>

# Create a commit
git commit
```

This will open up a text editor where you can craft your commit message.

#### Upstream Sync and Clean Up

Prior to submitting your pull request, you might want to do a few things to
clean up your branch and make it as simple as possible for the original
repository's maintainer to test, accept, and merge your work.

If any commits have been made to the upstream main branch, you should rebase
your development branch so that merging it will be a simple fast-forward that
won't require any conflict resolution work.

```bash
# Fetch upstream main and merge with your repository's main branch
git checkout main
git pull upstream main

# If there were any new commits, rebase your development branch
git checkout <branch-name>
git rebase main
```

Now, it may be desirable to squash some of your smaller commits down into a
small number of larger more cohesive commits. You can do this with an
interactive rebase:

```bash
# Rebase all commits on your development branch
git checkout <branch-name>
git rebase -i main
```

This will open up a text editor where you can specify which commits to squash.

#### Push and Test

```bash
# Checkout your branch
git checkout <branch-name>

# Push to your GitHub fork:
git push origin <branch-name>
```

This will trigger the continuous-integration checks. You can view the results in
the respective services. Note that the integration checks will report failures
on occasion.

### Review Requirements

All changes must reflect the material published in the human readable documents
published by the Data Model Workgroup. Pull Requests that do not match that 
content will not be accepted.

#### Submit Pull Request

Once you've validated the CI results, go to the page for your fork on GitHub,
select your development branch, and click the pull request button. If you need
to make any adjustments to your pull request, just push the updates to GitHub.
Your pull request will automatically track the changes on your development
branch and update.

#### Merge Requirements

-   Github Workflows pass
-   Builds pass
-   Tests pass
-   Linting passes
-   Code style passes
-   PR Approval by at least 2 companies other than the submitter

When can I merge? After these have been satisfied, a reviewer will merge the PR
into main
