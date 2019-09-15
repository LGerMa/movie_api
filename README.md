# README

Basic MovieAPI

**STACK DEVELOP VERSIONS**

- Rails 5.2.3
- Ruby 2.5.2
- PostgreSQL 10

****

**GEMS**

- Devise
- Doorkeeper
- Figaro (environmental vars)
- Rolify / CanCanCan (Manage roles and authorizations)
- Audited (Logged actions in some models)
- Money (money format)
- ActiveModelSerializers

*Test Cases*
- FactoryBot
- Faker
- Rspec-Rails
- Shoulda 

****

**SETUP**

1. Rename file `./config/application.yml.example` to `./config/application.yml`, then replace the value of `DATABASE_USERNAME`, `DATABASE_PASSWORD`
2. `bundle install`
3. `rails db:create && rails db:migrate`
4. `rails db:seed`
5. `rails s`

****

**Tests**

Run test cases with `rspec -fd`

****

**Credentials**

*Admin*
 
    {
        "grant_type": "password",
        "email": "admin@admin.com",
        "password": "admin123456"
    }

*User*
 
    {
        "grant_type": "password",
        "email": "user@user.com",
        "password": "user123456"
    }

Used doorkeeper gem to provide secure tokens.

Mostly actions needs a value of token to works as expected. That token must be passed in header value

`'Authorization': 'Bearer #{token}'`

**Documentation**
****List of endpoints used****

|Model| URL Postman |
|:---:|:---:|
|`Token`| [Here](https://documenter.getpostman.com/view/1061762/SVmtxehk?version=latest#f9ac21d6-6d75-413f-9594-f1325d4faa39) |
|`User`| [Here](https://documenter.getpostman.com/view/1061762/SVmtxehk?version=latest#5b8aec22-1fdc-418e-a27e-c828d4ece017) |
|`Movie`| [Here](https://documenter.getpostman.com/view/1061762/SVmtxehk?version=latest#17d5e40e-83af-4daf-b719-e27dc9e61b25) |
|`Rental`| [Here](https://documenter.getpostman.com/view/1061762/SVmtxehk?version=latest#c818b84e-79e3-423e-a92a-01291cb9acc0)|
|`Purshases`| [Here](https://documenter.getpostman.com/view/1061762/SVmtxehk?version=latest#43adcb10-709f-46ff-93bb-d80f9478d5b7) |
|`Likes`| [Here](https://documenter.getpostman.com/view/1061762/SVmtxehk?version=latest#e8f0dd6e-99cd-4ccd-b57b-b3466129826a) |

****

**POSTMAN DOCUMENTATION**

You can find postman documentation
[Here](https://documenter.getpostman.com/view/1061762/SVmtxehk?version=latest)