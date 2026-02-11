// Quick deployment test script
import { readFileSync } from 'fs';
import { join, dirname } from 'path';
import { fileURLToPath } from 'url';

const __filename = fileURLToPath(import.meta.url);
const __dirname = dirname(__filename);

console.log('🧪 Testing Deployment Setup...\n');

// Test 1: Check data files
console.log('1️⃣ Checking data files...');
try {
  const restaurants = JSON.parse(readFileSync(join(__dirname, 'backend/data/restaurants.json'), 'utf-8'));
  const menu = JSON.parse(readFileSync(join(__dirname, 'backend/data/menu.json'), 'utf-8'));
  console.log(`   ✅ Found ${restaurants.length} restaurants`);
  console.log(`   ✅ Found ${menu.length} menu items`);
} catch (error) {
  console.log('   ❌ Error reading data files:', error.message);
}

// Test 2: Check package.json files
console.log('\n2️⃣ Checking package.json files...');
try {
  const backendPkg = JSON.parse(readFileSync(join(__dirname, 'backend/package.json'), 'utf-8'));
  const frontendPkg = JSON.parse(readFileSync(join(__dirname, 'frontend/package.json'), 'utf-8'));
  console.log(`   ✅ Backend: ${backendPkg.name}`);
  console.log(`   ✅ Frontend: ${frontendPkg.name}`);
} catch (error) {
  console.log('   ❌ Error reading package.json:', error.message);
}

// Test 3: Check deployment configs
console.log('\n3️⃣ Checking deployment configs...');
const configs = ['Dockerfile', 'netlify.toml', 'vercel.json', 'render.yaml'];
configs.forEach(config => {
  try {
    readFileSync(join(__dirname, config), 'utf-8');
    console.log(`   ✅ ${config} exists`);
  } catch {
    console.log(`   ❌ ${config} missing`);
  }
});

console.log('\n✨ Deployment setup check complete!\n');
console.log('Next steps:');
console.log('1. Run: npm run install-all');
console.log('2. Test locally: npm run server (in one terminal) and npm run client (in another)');
console.log('3. Deploy using one of the methods in DEPLOYMENT.md');
