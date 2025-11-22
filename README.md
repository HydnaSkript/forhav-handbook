# ForHav Håndbok - Setup Guide

Dette er den komplette setup-guiden for ForHav sin interne håndbok med Decap CMS og MkDocs Material.

## 📋 Forutsetninger

- GitHub-konto
- Netlify-konto
- `forhav_handbook_vault.zip` (startinnhold)

## 🚀 Steg-for-steg oppsett

### 1. Opprett GitHub Repository

1. Gå til GitHub → New Repository
2. Navn: `forhav-handbook`
3. Velg **Private**
4. **IKKE** initialiser med README
5. Opprett repository

### 2. Klone og sett opp lokalt

```bash
# Klon det tomme repoet
git clone git@github.com:DITT-ORG/forhav-handbook.git
cd forhav-handbook

# Kopier alle filer fra handbook-setup/ mappen hit
# (admin/, mkdocs.yml, netlify.toml, .gitignore, requirements.txt)

# Pakk ut forhav_handbook_vault.zip til docs/ mappen
unzip forhav_handbook_vault.zip -d docs/

# Commit og push
git add .
git commit -m "Initial setup: Decap CMS + MkDocs Material"
git push origin main
```

### 3. Mappestruktur

Repoet skal se slik ut:

```
forhav-handbook/
├── admin/
│   ├── index.html
│   └── config.yml
├── docs/
│   ├── 00-INDEX/
│   ├── 01-Strategi-Marked/
│   ├── 02-Regulatoriske-ESRS/
│   ├── 03-Metode-Data-QAQC/
│   ├── 04-Produktstakk-KPI/
│   ├── 05-Salg-Posisjonering/
│   ├── 06-Compliance-Claims/
│   ├── 07-Dashboard-Maler/
│   ├── 12-Partnerskap/
│   ├── 14-Ordliste/
│   ├── 19-Case-Playbooks/
│   └── assets/
│       └── media/
├── mkdocs.yml
├── netlify.toml
├── requirements.txt
├── .gitignore
└── README.md
```

### 4. Koble til Netlify

1. Logg inn på [Netlify](https://app.netlify.com)
2. Klikk "Add new site" → "Import an existing project"
3. Velg GitHub og koble til `forhav-handbook` repoet
4. Netlify vil automatisk oppdage `netlify.toml` - klikk "Deploy site"

### 5. Sett opp Netlify Identity

1. I Netlify dashboard, gå til **Site settings** → **Identity**
2. Klikk **Enable Identity**
3. Under **Registration preferences**: Velg **Invite only**
4. Under **External providers**: Deaktiver alle (kun email)
5. Under **Emails**: Tilpass invite-epost (valgfritt)

### 6. Aktiver Git Gateway

1. I Netlify dashboard, gå til **Site settings** → **Identity** → **Services**
2. Under **Git Gateway**: Klikk **Enable Git Gateway**
3. Dette gir Decap CMS tilgang til å skrive til GitHub-repoet

### 7. Inviter redaktører

1. I Netlify dashboard, gå til **Identity** → **Invite users**
2. Legg til e-postadresser (kun @forhav.no-domenet)
3. Brukere får en invite-epost med link til å sette passord

### 8. Sett opp branch protection (GitHub)

1. Gå til GitHub repo → **Settings** → **Branches**
2. Under **Branch protection rules**, klikk **Add rule**
3. Branch name pattern: `main`
4. Huk av:
   - ✅ Require a pull request before merging
   - ✅ Require approvals (1 godkjenning)
5. Lagre endringer

### 9. Konfigurer subdomain

**Alternativ A: Netlify DNS (enklest)**
1. I Netlify: **Site settings** → **Domain management**
2. Klikk **Add custom domain** → `handbook.forhav.no`
3. Følg instruksjonene for DNS-oppsett

**Alternativ B: Ekstern DNS**
1. Gå til din DNS-leverandør (hvor forhav.no er registrert)
2. Legg til en CNAME-record:
   - Name: `handbook`
   - Value: `DITT-NETLIFY-NETTSTED.netlify.app`
3. I Netlify: Legg til `handbook.forhav.no` som custom domain

### 10. Test oppsettet

1. Gå til `https://handbook.forhav.no`
   - Skal vise håndbok-hjemmesiden
2. Gå til `https://handbook.forhav.no/admin`
   - Skal vise Decap CMS login
3. Logg inn med invite-brukeren
4. Opprett et testdokument
5. Verifiser at det opprettes en Pull Request i GitHub
6. Godkjenn PR → merge
7. Verifiser at siden oppdateres

## 🔧 Redaktørflyt (Editorial Workflow)

1. **Redaktør logger inn** på `/admin`
2. **Velg collection** (f.eks. "01 Strategi/Marked")
3. **Opprett ny** eller **rediger eksisterende** dokument
4. **Lagre** → Decap CMS oppretter automatisk en Pull Request
5. **Approver** får varsel (GitHub notifications)
6. **Approver** sjekker endringer og merger PR
7. **Netlify** bygger og publiserer automatisk

## 📁 Legge til bilder

1. I Decap CMS editor: Bruk bildeknappen i markdown-editor
2. Last opp bilde → lagres i `docs/assets/media/`
3. Bildene blir tilgjengelige både i Obsidian og på nettsiden

## 🛠️ Lokal utvikling (valgfritt)

```bash
# Installer Python-dependencies
pip install -r requirements.txt

# Kjør lokal server
mkdocs serve

# Besøk http://127.0.0.1:8000
```

## 🔐 Roller og tilganger

- **Editor**: Kan opprette/redigere dokumenter (lager PR)
- **Approver**: Kan godkjenne og merge PR (GitHub repo access)

## 📞 Support

Ved problemer:
- **Teknisk**: hei@forhav.no
- **GitHub Issues**: Opprett issue i repoet

## 🎯 Neste steg (valgfritt)

- [ ] Sett opp KI-agent for batch-oppdateringer (GitHub Actions)
- [ ] Legg til Slack/Teams-notifikasjoner for deploys
- [ ] Konfigurer søk (MkDocs Material har innebygd søk)
- [ ] Tilpass design/tema i `mkdocs.yml`

## 📚 Dokumentasjon

- [Decap CMS](https://decapcms.org/docs/intro/)
- [MkDocs Material](https://squidfunk.github.io/mkdocs-material/)
- [Netlify Identity](https://docs.netlify.com/visitor-access/identity/)
- [Git Gateway](https://docs.netlify.com/visitor-access/git-gateway/)
