FROM python:3-alpine

# Install some Python global packages for the build container.
RUN pip3 install \
    --break-system-packages \
    mkdocs \
    mkdocs-awesome-pages-plugin \
    mkdocs-git-authors-plugin \
    mkdocs-git-revision-date-localized-plugin \
    mkdocs-material \
    mkdocs-material[imaging] \
    mkdocs-redirects \
    mike \
    pymdown-extensions

# Add a non-privileged user to build sites with.
RUN adduser -S mkdocs

# Change to the non-privileged user.
USER mkdocs

# Change the command to use mkdocs by default.
CMD [ "/usr/local/bin/mkdocs" ]