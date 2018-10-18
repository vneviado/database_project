drop database if exists snapchat;
create database snapchat;

\connect snapchat

\i create.sql

\copy PersonalUser(name,snapscore,start_date,username) FROM 'PersonalUser.csv' csv header
\copy Filter(filterId) FROM 'Filter.csv' csv header
\copy Geotag(location,geoId) FROM 'Geotag.csv' csv header
\copy PhotoFilter(media,ownerId,finalId,filterId,geoId) FROM 'PhotoFilter.csv' csv header
\copy Friendships(username1,username2,friendshipId) FROM 'Friendships.csv' csv header
\copy Story(duration,media,location,filterId,timePosted,storyId) FROM 'Story.csv' csv header
\copy PersonalUserStory(storyId,username) FROM 'PersonalUserStory.csv' csv header
\copy StoryView(storyId,opened,username) FROM 'StoryView.csv' csv header
\copy BusinessUser(username,name,billing_account) FROM 'BusinessUser.csv' csv header
\copy BusinessUser_Story(storyId,username) FROM 'BusinessUser_Story.csv' csv header
\copy Snap(duration,media,snapId,location,filterId,username) FROM 'Snap.csv' csv header
\copy SnapView(snapId,username,opened) FROM 'SnapView.csv' csv header

