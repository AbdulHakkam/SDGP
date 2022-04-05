//creating model of pets
import 'package:flutter/material.dart';

class Product {
  final String image, title, description;
  final int id;

  Product({
    required this.id,
    required this.image,
    required this.title,
    required this.description,
  });
}

List<Product> products = [
  Product(
    id: 1,
    title: "Pomeranian",
    description: "Cotton ia an active, smart, female dog "
        "who enjoys playing with his human family and responds well to traning. ",
    image: "assets/pug.jpg",),

  Product(
    id: 2,
    title: "Labrador",
    description: "Poppy is a very loyal dog who needs so much love. He is really gentle and very cuddly. Lowry is very good  with kids and of course he is adorable.",
    image: "assets/labrador.png",),

  Product(
    id: 3,
    title: "Siberian Husky",
    description: "Windy is an intelligent dog who loves to  jog  with his partner. So if you are looking for a jogging partner, this is your choice. She has beautiful blue eyes. Though she looks intimidating from outside, she is a total baby in inside.",
    image: "assets/husky.png",),

  Product(
    id: 4,
    title: "Golden Retriever",
    description: "Bella is a cream gold, playful dog. She is gentle with children and tend to get along well with other pets and strangers. She is not a often barker, but she can make you aware when a stranger is approaching. ",
    image: "assets/GoldenRetriver.png",),

  Product(
    id: 5,
    title: "German Shepherd",
    description: "Luna is an incredibly noble and a loyal dog. She is confident, courageous and at the same time very intelligent. She is very active throughout the day. She is not too much pet-friendly but a nice one. ",
    image: "assets/GermanShepherd.png",
  ),

  Product(
    id: 6,
    title: "Doberman",
    description: "Dominic is easy to train and very energetic. He is trustworthy and protective of the children in their family, as long as he is been socialized and trained appropriately. ",
    image: "assets/Doberman.png",
  ),

];
