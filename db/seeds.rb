# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Upvote.destroy_all
Comment.destroy_all
User.destroy_all
Doctor.destroy_all

d1=Doctor.create!(specialty: "pediatry")
d2=Doctor.create!(specialty: "dentist")
d3=Doctor.create!(specialty: "dentist")
d4=Doctor.create!(specialty: "urologist")

u1=User.create!(email: "test@test.com", password: "testtest", role: "patient")
u2=User.create!(email: "example@example.com", password: "exampleexmple", role: "patient")
u3=User.create!(email: "try@try.com", password: "trytry", doctor: d1, role: "doctor")
u4=User.create!(email: "attemp@attempt.com", password: "attemptattempt", doctor: d2, role: "doctor")
u5=User.create!(email: "new@new.com", password: "newnew", doctor: d2, role: "doctor")
u6=User.create!(email: "admin@admin.com", password: "adminadmin", role: "admin")

c1=Comment.create!(text: "d1 from u1", user: u1, doctor: d1)
c2=Comment.create!(text: "d1 from u2", user: u2, doctor: d1)
c3=Comment.create!(text: "d2 from u2", user: u2, doctor: d2)

up1=c1.upvotes.create!(user: u1)
up2=c1.upvotes.create!(user: u2)
up3=c2.upvotes.create!(user: u1)
up4=c3.upvotes.create!(user: u3)
