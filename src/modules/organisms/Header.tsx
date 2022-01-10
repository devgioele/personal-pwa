import AppBar from '@mui/material/AppBar';
import Container from '@mui/material/Container';
import Toolbar from '@mui/material/Toolbar';
import { styled } from '@mui/material';

const Offset = styled('div')(({ theme }) => theme.mixins.toolbar);

const Header = () => {
  return (
    <>
      <AppBar position="fixed">
        <Toolbar disableGutters>
          <Container maxWidth="lg" sx={{ width: '80%' }}>
            Gioele De Vitti
          </Container>
        </Toolbar>
      </AppBar>
      <Offset />
    </>
  );
};

export default Header;
