#!/bin/bash

# Copyright 2025 Aquiles Trindade (trindadedev).
# Licensed by Apache 2.0 License.

# Variables

# Dir where files to be format is located.
TO_FORMAT_DIR="./"

CACHE_DIR="$HOME/.cache/trindadedev/formatters"

# Java Formatter Vars
JAVA_FORMATTER_DIR="$CACHE_DIR/google-java-format.jar"
JAVA_FORMATTER_VERSION="1.25.2"
JAVA_FORMATTER_URL="https://github.com/google/google-java-format/releases/download/v$JAVA_FORMATTER_VERSION/google-java-format-$JAVA_FORMATTER_VERSION-all-deps.jar"

# XML Formatter Vars
XML_FORMATTER_DIR="$CACHE_DIR/android-xml-formatter.jar"
XML_FORMATTER_VERSION="1.1.1"
XML_FORMATTER_URL="https://github.com/teixeira0x/android-xml-formatter/releases/download/v$XML_FORMATTER_VERSION/android-xml-formatter.jar"

# Kotlin Formatter Vars
KOTLIN_FORMATTER_DIR="$CACHE_DIR/ktfmt.jar"
KOTLIN_FORMATTER_VERSION="0.53"
KOTLIN_FORMATTER_URL="https://github.com/facebook/ktfmt/releases/download/v$KOTLIN_FORMATTER_VERSION/ktfmt-$KOTLIN_FORMATTER_VERSION-jar-with-dependencies.jar"

mkdir -p "$CACHE_DIR"

# --- Java Formatter ---
read -p "You want to format all Java Classes of This directory and subdirectories? (Y/N): " javaAnswer

case "$javaAnswer" in
  [Yy]* )
    if [ ! -f "$JAVA_FORMATTER_DIR" ]; then
      echo "Downloading Google Java Formatter..."
      wget -q "$JAVA_FORMATTER_URL" -O "$JAVA_FORMATTER_DIR"
    fi

    echo "Formatting Java files..."
    find "$TO_FORMAT_DIR" -name "*.java" -exec java -jar "$JAVA_FORMATTER_DIR" --replace {} +

    ;;
  [Nn]* )
    ;;
  * )
    echo "Invalid option. Exiting."
    exit 1
    ;;
esac

# --- XML Formatter ---
read -p "You want to format all XML Files of This directory and subdirectories? (Y/N): " xmlAnswer

case "$xmlAnswer" in
  [Yy]* )
    if [ ! -f "$XML_FORMATTER_DIR" ]; then
      echo "Downloading Android XML Formatter..."
      wget -q "$XML_FORMATTER_URL" -O "$XML_FORMATTER_DIR"
    fi

    echo "Formatting XML Files...."
    find "$TO_FORMAT_DIR" -name "*.xml" -exec java -jar "$XML_FORMATTER_DIR" --indention 4 --attribute-indention 4 {} \;

    ;;
  [Nn]* )
    ;;
  * )
    echo "Invalid option. Exiting."
    exit 1
    ;;
esac


# --- Kotlin Formatter ---
read -p "You want to format all Kotlin Files of This directory and subdirectories? (Y/N): " kotlinAnswer

case "$kotlinAnswer" in
  [Yy]* )
    if [ ! -f "$KOTLIN_FORMATTER_DIR" ]; then
      echo "Downloading Facebook KtFmt..."
      wget -q "$KOTLIN_FORMATTER_URL" -O "$KOTLIN_FORMATTER_DIR"
    fi

    echo "Formatting Kotlin files..."
    find "$TO_FORMAT_DIR" -name "*.kt" -exec java -jar "$KOTLIN_FORMATTER_DIR" --google-style {} +

    ;;
  [Nn]* )
    ;;
  * )
    echo "Invalid option. Exiting."
    exit 1
    ;;
esac
