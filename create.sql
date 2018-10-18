-- Created by Vertabelo (http://vertabelo.com)
-- Last modification date: 2017-12-02 21:40:24.415

-- tables
-- Table: BusinessUser
CREATE TABLE BusinessUser (
    username varchar  NOT NULL,
    name varchar  NOT NULL,
    billing_account int  NOT NULL,
    CONSTRAINT BusinessUser_pk PRIMARY KEY (username)
);

-- Table: BusinessUser_Story
CREATE TABLE BusinessUser_Story (
    storyId serial  NOT NULL,
    username varchar  NOT NULL,
    CONSTRAINT BusinessUser_Story_pk PRIMARY KEY (storyId)
);

-- Table: Filter
CREATE TABLE Filter (
    filterId int  NOT NULL,
    CONSTRAINT Filter_pk PRIMARY KEY (filterId)
);

-- Table: Friendships
CREATE TABLE Friendships (
    username1 varchar  NOT NULL,
    username2 varchar  NOT NULL,
    friendshipId int  NOT NULL,
    CONSTRAINT Friendships_pk PRIMARY KEY (friendshipId)
);

-- Table: Geotag
CREATE TABLE Geotag (
    location varchar  NOT NULL,
    geoId int  NOT NULL,
    CONSTRAINT Geotag_pk PRIMARY KEY (geoId)
);

-- Table: PersonalUser
CREATE TABLE PersonalUser (
    name varchar  NOT NULL,
    snapscore int  NOT NULL,
    start_date date  NOT NULL,
    username varchar  NOT NULL,
    CONSTRAINT PersonalUser_pk PRIMARY KEY (username)
);

-- Table: PersonalUserStory
CREATE TABLE PersonalUserStory (
    storyId serial  NOT NULL,
    username varchar  NOT NULL,
    CONSTRAINT PersonalUserStory_pk PRIMARY KEY (storyId)
);

-- Table: PhotoFilter
CREATE TABLE PhotoFilter (
    media varchar  NOT NULL,
    ownerId varchar  NOT NULL,
    finalId serial  NOT NULL,
    filterId int  NOT NULL,
    geoId int  NOT NULL,
    CONSTRAINT PhotoFilter_pk PRIMARY KEY (finalId)
);

-- Table: Snap
CREATE TABLE Snap (
    duration int  NOT NULL,
    media varchar  NOT NULL,
    snapId serial  NOT NULL,
    location varchar  NOT NULL,
    filterId serial  NOT NULL,
    username varchar  NOT NULL,
    CONSTRAINT Snap_pk PRIMARY KEY (snapId)
);

-- Table: SnapView
CREATE TABLE SnapView (
    snapId serial  NOT NULL,
    username varchar  NOT NULL,
    opened boolean  NOT NULL,
    CONSTRAINT SnapView_pk PRIMARY KEY (snapId,username)
);

-- Table: Story
CREATE TABLE Story (
    duration int  NOT NULL,
    media varchar  NOT NULL,
    location varchar  NOT NULL,
    filterId serial  NOT NULL,
    timeposted time  NOT NULL,
    storyId serial  NOT NULL,
    CONSTRAINT Story_pk PRIMARY KEY (storyId)
);

-- Table: StoryView
CREATE TABLE StoryView (
    storyId int  NOT NULL,
    opened boolean  NOT NULL,
    username varchar  NOT NULL,
    CONSTRAINT StoryView_pk PRIMARY KEY (storyId,username)
);

-- foreign keys
-- Reference: BusinessUser_Story_BusinessUser (table: BusinessUser_Story)
ALTER TABLE BusinessUser_Story ADD CONSTRAINT BusinessUser_Story_BusinessUser
    FOREIGN KEY (username)
    REFERENCES BusinessUser (username)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: BusinessUser_Story_Story (table: BusinessUser_Story)
ALTER TABLE BusinessUser_Story ADD CONSTRAINT BusinessUser_Story_Story
    FOREIGN KEY (storyId)
    REFERENCES Story (storyId)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: Friends_User (table: Friendships)
ALTER TABLE Friendships ADD CONSTRAINT Friends_User
    FOREIGN KEY (username1)
    REFERENCES PersonalUser (username)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: Friendships_User (table: Friendships)
ALTER TABLE Friendships ADD CONSTRAINT Friendships_User
    FOREIGN KEY (username2)
    REFERENCES PersonalUser (username)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: PersonalUserStory_PersonalUser (table: PersonalUserStory)
ALTER TABLE PersonalUserStory ADD CONSTRAINT PersonalUserStory_PersonalUser
    FOREIGN KEY (username)
    REFERENCES PersonalUser (username)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: PersonalUserStory_Story (table: PersonalUserStory)
ALTER TABLE PersonalUserStory ADD CONSTRAINT PersonalUserStory_Story
    FOREIGN KEY (storyId)
    REFERENCES Story (storyId)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: PhotoFilter_Filter (table: PhotoFilter)
ALTER TABLE PhotoFilter ADD CONSTRAINT PhotoFilter_Filter
    FOREIGN KEY (filterId)
    REFERENCES Filter (filterId)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: PhotoFilter_Geotag (table: PhotoFilter)
ALTER TABLE PhotoFilter ADD CONSTRAINT PhotoFilter_Geotag
    FOREIGN KEY (geoId)
    REFERENCES Geotag (geoId)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: SnapView_Snap (table: SnapView)
ALTER TABLE SnapView ADD CONSTRAINT SnapView_Snap
    FOREIGN KEY (snapId)
    REFERENCES Snap (snapId)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: SnapView_User (table: SnapView)
ALTER TABLE SnapView ADD CONSTRAINT SnapView_User
    FOREIGN KEY (username)
    REFERENCES PersonalUser (username)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: Snap_PhotoFilter (table: Snap)
ALTER TABLE Snap ADD CONSTRAINT Snap_PhotoFilter
    FOREIGN KEY (filterId)
    REFERENCES PhotoFilter (finalId)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: Snap_User (table: Snap)
ALTER TABLE Snap ADD CONSTRAINT Snap_User
    FOREIGN KEY (username)
    REFERENCES PersonalUser (username)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: StoryView_Story (table: StoryView)
ALTER TABLE StoryView ADD CONSTRAINT StoryView_Story
    FOREIGN KEY (storyId)
    REFERENCES Story (storyId)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: StoryView_User (table: StoryView)
ALTER TABLE StoryView ADD CONSTRAINT StoryView_User
    FOREIGN KEY (username)
    REFERENCES PersonalUser (username)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: Story_PhotoFilter (table: Story)
ALTER TABLE Story ADD CONSTRAINT Story_PhotoFilter
    FOREIGN KEY (filterId)
    REFERENCES PhotoFilter (finalId)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- End of file.

