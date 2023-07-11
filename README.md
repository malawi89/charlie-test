# README

This is a Rails app setup as an (API)[https://guides.rubyonrails.org/api_app.html] for the backend, with a Next.js app on the frontend.

## Backend

The backend is quite limited, with:

- one model `User` to store a user's name, dob and employment start date.
- one service object `CharlieMenu` that takes a supplied user and returns a hash comprising of the preset menu and the logo. The logo is determined by comparing the month and day of today's date with that of the supplied user's birthday and employment start date, as well as to Halloween and Christmas. I put precedence as birthday > anniversary > halloween/christmas.
- a controller `UsersController` to send all user data to the frontend
- a controller `Users::MenuController` to send the menu for a specific user to the frontend
- seeds - because the logic is based on Today's date and I didn't want to deal with setting the date from the frontend I opted to create 2 users for every date of the remainder of this month, 1 with a dob matching the date and another with the employment start date matching the date. This does mean that this test will need to be reviewed this month (hopefully not a problem). Also the Halloween and Christmas logos can't be tested, unless you want to wait until October 31 and Dec 25!

## Frontend

This is a (Next.js app)[https://nextjs.org/] with (Tailwind CSS)[https://tailwindcss.com/] integrated.

I've gone for a fairly simple approach:

- Main page `page.js`, which handles the fetching of all users using `axios`. These populate a dropdown from which the `user` is set. This then fires off a request to the api to pull the menu data for that user.
- This data is passed on to a `Menu` component which handles the menu part of the data and loads it into a clickable tooltip using (react-tooltip)[https://react-tooltip.com/docs/getting-started]
- The hat part of the data is then passed on to a `Logo` component which handles the logic for which image to display and adds a tooltip to the left of the logo with the provided message.

## How to run

### Rails side

Shouldn't be anything too fancy here. Just your standard `bundle install`, `rails db:create db:migrate db:seed`

Then `rails s` to start a server

### Frontend

Open a new terminal
Switch into the frontend `cd charlie-frontend`
`yarn` to install dependencies.
`yarn dev` to start the frontend client
This will run on `localhost:3001`

- Ruby version

- System dependencies

- Configuration

- Database creation

- Database initialization

- How to run the test suite

- Services (job queues, cache servers, search engines, etc.)

- Deployment instructions

- ...
