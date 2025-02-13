#!/bin/bash

# Formatting script made by Aquiles Trindade (trindadedev) with love ❤.

# Variables
CACHE_DIR="$HOME/.cache/trindadedev/formatters"

# Java Formatter Vars
JAVA_FORMATTER_DIR="$CACHE_DIR/google-java-format.jar"
JAVA_FORMATTER_VERSION="1.25.2"
JAVA_FORMATTER_URL="https://github.com/google/google-java-format/releases/download/v$JAVA_FORMATTER_VERSION/google-java-format-$JAVA_FORMATTER_VERSION-all-deps.jar"

# XML Formatter Vars
XML_FORMATTER_DIR="$CACHE_DIR/android-xml-formatter.jar"
XML_FORMATTER_VERSION="1.1.1"
XML_FORMATTER_URL="https://github.com/teixeira0x/android-xml-formatter/releases/download/v$XML_FORMATTER_VERSION/android-xml-formatter.jar"

mkdir -p "$CACHE_DIR"

# --- Java Formatter ---
if [ ! -f "$JAVA_FORMATTER_DIR" ]; then
  echo "Downloading Google Java Formatter..."
  wget -q "$JAVA_FORMATTER_URL" -O "$JAVA_FORMATTER_DIR"
fi

echo "Formatting Java files..."
find ../ -name "*.java" -exec java -jar "$JAVA_FORMATTER_DIR" --aosp --replace {} +

# --- XML Formatter ---
if [ ! -f "$XML_FORMATTER_DIR" ]; then
  echo "Downloading Android XML Formatter..."
  wget -q "$XML_FORMATTER_URL" -O "$XML_FORMATTER_DIR"
fi

echo "Formatting XML Files...."
find ../ -name "*.xml" -exec java -jar "$XML_FORMATTER_DIR" --indention 4 --attribute-indention 4 {} \;