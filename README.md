# README:  Association Volunteer Manager (AVM)
AVM is a digital tool for keeping track of an association's technical volunteers and the various groups they belong to.  Volunteers can have many goups and groups can have many volunteers, which are linked by a Statement of Expertise unique to each group per volunteer.  The app allows  you to create, read/view, update, and delete volunteers, groups, and their statements, email any group with one click, and even store your volunteers' CVs.  It offers numerous ways to filter each of these categories in an effort to make it as easy as possible for the system user to obtain the data the need fast.  System users are meant to collaborate so objects are not necessarily  tied to individual users, but 'admin' status is required for most CRUD functionality.  Non admin users may also be created but are limited mostly to read only access.  

## Instructions for Use:  
Clone the [volunteer manager repo](https://github.com/christopherdent/VolunteerManager.git) and open a terminal in the VolunteerManager folder. Local development uses Ruby 3.2.2, Bundler 2.7.1, Node 22, and Docker for Postgres.

```sh
rvm use 3.2.2
bundle install
docker compose -f docker-compose.dev.yml up -d db
npm ci
npm run build
bundle exec rails db:prepare
RAILS_ENV=test bundle exec rails db:prepare
```

Postgres is exposed only on `127.0.0.1:5433`, matching `config/database.yml`. `db:prepare` initializes a new development database with demo data. Avoid running `db:seed` on an existing database: the seed script replaces its users, volunteers, groups, and memberships.

On Macs where RVM's Ruby build crashes in `miniruby` with `-std=gnu23`, the following C17 override was verified for Ruby 3.2.2:

```sh
rvm install 3.2.2 --autolibs=0 -- CFLAGS="-O3 -std=gnu17"
rvm use 3.2.2
gem install bundler -v 2.7.1 --no-document
```

RVM must be loaded as a shell function for version switching; add `[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"` to `~/.zshrc` if it is missing. The `--autolibs=0` installation command assumes Homebrew build dependencies are already installed.

## Usage
Run `bundle exec rails server -b 127.0.0.1 -p 3001` and open http://localhost:3001. Port 3001 avoids conflicting with other Rails apps on port 3000. A newly seeded database includes the demo login `guest / guest`. Development runs at the root path.

Run the URL-prefix regression checks with `bundle exec rails test test/integration/url_prefix_test.rb`.

## Demo Video
Available <a href = "https://www.youtube.com/watch?v=v6ifLuecsmA&t=8s">here. </a>

Or see it live at https://volunteermanager.herokuapp.com (email christopherdent01@gmail.com for credentials)

## Built With

Currently uses Ruby 3.2.x and Rails 7.0.8.7, with Bootstrap 5 in the application layout.


docker build -t volunteermanager:prod .
docker run -p 3000:3000 \
  -e RAILS_ENV=production \
  -e RACK_ENV=production \
  -e SECRET_KEY_BASE=$(rails secret) \
  -e DATABASE_URL=postgres://volunteer_user:secure_password@host.docker.internal:5433/volunteer_manager_development \
  volunteermanager:prod
