#!/bin/bash
set -e

echo "📦 Installing Python dependencies..."
pip install -r requirements.txt

echo "🏗️  Building MkDocs site..."
python -m mkdocs build

echo "📋 Copying admin interface..."
cp -r admin site/

echo "✅ Build complete!"
