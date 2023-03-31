# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

- Ruby version

- System dependencies

- Configuration

- Database creation

- Database initialization

- How to run the test suite

- Services (job queues, cache servers, search engines, etc.)

- Deployment instructions

- ...

### References

#### Auth

https://fullstackheroes.com/tutorials/rails/sorcery-passwordless-authentication/

#### Email

https://norton-allene.medium.com/quick-start-guide-to-smtp-settings-in-rails-6-environments-624097ff55f4

#### Postgres on local

If you need to have postgresql@15 first in your PATH, run:

```shell
echo 'export PATH="/usr/local/opt/postgresql@15/bin:$PATH"' >> ~/.bash_profile
```

For compilers to find postgresql@15 you may need to set:

```shell
export LDFLAGS="-L/usr/local/opt/postgresql@15/lib"
export CPPFLAGS="-I/usr/local/opt/postgresql@15/include"
```

For pkg-config to find postgresql@15 you may need to set:

```shell
export PKG_CONFIG_PATH="/usr/local/opt/postgresql@15/lib/pkgconfig"
```

https://github.com/Homebrew/homebrew-core/issues/109644#issuecomment-1236429680

```shell
bundle pristine pg
```
