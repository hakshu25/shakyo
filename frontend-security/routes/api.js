import express from 'express';

const router = express.Router();

router.get('/', (req, res) => {
  res.setHeader('X-Timestamp', Date.now());
  const lang = req.headers['x-lang'];
  let message = req.query.message;

  if (message === '') {
    res.status(400);
    let errorMessage = '';
    if (lang === 'en') {
      errorMessage = 'message is empty';
    } else {
      errorMessage = 'messageの値が空です';
    }

    res.send({ message: errorMessage });
    return;
  }

  res.send({ message });
});

router.use(express.json());
router.post('/', (req, res) => {
  const body = req.body;
  console.log(body);
  res.end();
});

export default router;
