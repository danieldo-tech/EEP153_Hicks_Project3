
# =========================
# ✏️ EDIT THESE TWO LINES
# =========================
NAME="Daniel Do"
EMAIL="danieldo@berkeley.edu"

# =========================
# DONT CHANGE BELOW
# =========================

echo "🔧 Configuring Git identity..."
git config --global user.name "$NAME"
git config --global user.email "$EMAIL"

# Ensure ~/.ssh exists.. 
# not strictly necessary but mkdir (make directory) is a nifty command, and I couldn't resist
mkdir -p ~/.ssh

# Only generate a key if one doesn't already exist
if [ -f ~/.ssh/id_ed25519 ]; then
  echo "⚠️ SSH key already exists — skipping key generation."
else
  echo "🔑 Generating SSH key..."
  ssh-keygen -t ed25519 -C "$EMAIL" -f ~/.ssh/id_ed25519 -N ""
fi

echo "🚀 Starting ssh-agent..."
eval "$(ssh-agent -s)"
